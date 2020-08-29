function [x,y1,y2]=RK2_predict(N,x0,xN,y10,y20,f1,f2)

%***************************************************************************
% This is a function that solves 2 second order differential %equation, which is reduced to a pair of first order equations.
%The inputs to the function are N, the no. of integration %points, x0 & xN, the end points of the domain for the %independent variable, y10 & y20, the values of y1 and y2 at the %initial point, f1 & f2, the two RHS functions in the system of %equations.
%**************************************************************

h=(xN-x0)/(N-1);
y1(1)=y10;y2(1)=y20;x(1)=x0;
epsilon=0.001;

for n=2:N
    k11=h*f1(x(n-1),y1(n-1),y2(n-1));
    k21=h*f2(x(n-1),y1(n-1),y2(n-1));
    
    k12=h*f1(x(n-1)+h,y1(n-1)+k11,y2(n-1)+k21);
    k22=h*f2(x(n-1)+h,y1(n-1)+k11,y2(n-1)+k21);

    y1(n)=y1(n-1)+(k11+k12)/2;
    y2(n)=y2(n-1)+(k21+k22)/2;
    x(n)=x(n-1)+h;
    while 1
        y1old=y1(n);
        k12=h*f1(x(n),y1(n),y2(n));
        k22=h*f2(x(n),y1(n),y2(n));
        y1(n)=y1(n-1)+(k11+k12)/2;
        y2(n)=y2(n-1)+(k21+k22)/2;
        if (abs(y1(n)-y1old)/abs(y1old))<epsilon
            break;
        end
    end
    
end

%****************************************************************************
% The ‘k’ values are computed in each step and all the three variables, x, y1 %and y2 are computed for the next step.

end