function [x,y1,y2,y3,y4,y5,y6]=RK4_new(N,x0,xN,y10,y20,y30,y40,y50,y60,f1,f2,f3,f4,f5,f6)

%***************************************************************************
% This is a function that solves 2 second order differential %equation, which is reduced to a pair of first order equations.
%The inputs to the function are N, the no. of integration %points, x0 & xN, the end points of the domain for the %independent variable, y10 & y20, the values of y1 and y2 at the %initial point, f1 & f2, the two RHS functions in the system of %equations.
%**************************************************************

h=(xN-x0)/(N-1);
y1(1)=y10;y2(1)=y20;x(1)=x0;y3(1)=y30;y4(1)=y40;y5(1)=y50;y6(1)=y60;

for n=2:N
    k11=h*f1(x(n-1),y1(n-1),y2(n-1),y3(n-1),y4(n-1),y5(n-1),y6(n-1));
    k21=h*f2(x(n-1),y1(n-1),y2(n-1),y3(n-1),y4(n-1),y5(n-1),y6(n-1));
    k31=h*f3(x(n-1),y1(n-1),y2(n-1),y3(n-1),y4(n-1),y5(n-1),y6(n-1));
    k41=h*f4(x(n-1),y1(n-1),y2(n-1),y3(n-1),y4(n-1),y5(n-1),y6(n-1));
    k51=h*f5(x(n-1),y1(n-1),y2(n-1),y3(n-1),y4(n-1),y5(n-1),y6(n-1));
    k61=h*f6(x(n-1),y1(n-1),y2(n-1),y3(n-1),y4(n-1),y5(n-1),y6(n-1));
    k12=h*f1(x(n-1)+h/2,y1(n-1)+k11/2,y2(n-1)+k21/2,y3(n-1)+k31/2,y4(n-1)+k41/2,y5(n-1)+k51/2,y6(n-1)+k61/2);
    k22=h*f2(x(n-1)+h/2,y1(n-1)+k11/2,y2(n-1)+k21/2,y3(n-1)+k31/2,y4(n-1)+k41/2,y5(n-1)+k51/2,y6(n-1)+k61/2);
    k32=h*f3(x(n-1)+h/2,y1(n-1)+k11/2,y2(n-1)+k21/2,y3(n-1)+k31/2,y4(n-1)+k41/2,y5(n-1)+k51/2,y6(n-1)+k61/2);
    k42=h*f4(x(n-1)+h/2,y1(n-1)+k11/2,y2(n-1)+k21/2,y3(n-1)+k31/2,y4(n-1)+k41/2,y5(n-1)+k51/2,y6(n-1)+k61/2);
    k52=h*f5(x(n-1)+h/2,y1(n-1)+k11/2,y2(n-1)+k21/2,y3(n-1)+k31/2,y4(n-1)+k41/2,y5(n-1)+k51/2,y6(n-1)+k61/2);
    k62=h*f6(x(n-1)+h/2,y1(n-1)+k11/2,y2(n-1)+k21/2,y3(n-1)+k31/2,y4(n-1)+k41/2,y5(n-1)+k51/2,y6(n-1)+k61/2);
    k13=h*f1(x(n-1)+h/2,y1(n-1)+k12/2,y2(n-1)+k22/2,y3(n-1)+k32/2,y4(n-1)+k42/2,y5(n-1)+k52/2,y6(n-1)+k62/2);
    k23=h*f2(x(n-1)+h/2,y1(n-1)+k12/2,y2(n-1)+k22/2,y3(n-1)+k32/2,y4(n-1)+k42/2,y5(n-1)+k52/2,y6(n-1)+k62/2);
    k33=h*f3(x(n-1)+h/2,y1(n-1)+k12/2,y2(n-1)+k22/2,y3(n-1)+k32/2,y4(n-1)+k42/2,y5(n-1)+k52/2,y6(n-1)+k62/2);
    k43=h*f4(x(n-1)+h/2,y1(n-1)+k12/2,y2(n-1)+k22/2,y3(n-1)+k32/2,y4(n-1)+k42/2,y5(n-1)+k52/2,y6(n-1)+k62/2);
    k53=h*f5(x(n-1)+h/2,y1(n-1)+k12/2,y2(n-1)+k22/2,y3(n-1)+k32/2,y4(n-1)+k42/2,y5(n-1)+k52/2,y6(n-1)+k62/2);
    k63=h*f6(x(n-1)+h/2,y1(n-1)+k12/2,y2(n-1)+k22/2,y3(n-1)+k32/2,y4(n-1)+k42/2,y5(n-1)+k52/2,y6(n-1)+k62/2);
    k14=h*f1(x(n-1)+h,y1(n-1)+k13,y2(n-1)+k23,y3(n-1)+k33,y4(n-1)+k43,y5(n-1)+k53,y6(n-1)+k63);
    k24=h*f2(x(n-1)+h,y1(n-1)+k13,y2(n-1)+k23,y3(n-1)+k33,y4(n-1)+k43,y5(n-1)+k53,y6(n-1)+k63);
    k34=h*f3(x(n-1)+h,y1(n-1)+k13,y2(n-1)+k23,y3(n-1)+k33,y4(n-1)+k43,y5(n-1)+k53,y6(n-1)+k63);
    k44=h*f4(x(n-1)+h,y1(n-1)+k13,y2(n-1)+k23,y3(n-1)+k33,y4(n-1)+k43,y5(n-1)+k53,y6(n-1)+k63);
    k54=h*f5(x(n-1)+h,y1(n-1)+k13,y2(n-1)+k23,y3(n-1)+k33,y4(n-1)+k43,y5(n-1)+k53,y6(n-1)+k63);
    k64=h*f6(x(n-1)+h,y1(n-1)+k13,y2(n-1)+k23,y3(n-1)+k33,y4(n-1)+k43,y5(n-1)+k53,y6(n-1)+k63);
    y1(n)=y1(n-1)+(k11+2*k12+2*k13+k14)/6;
    y2(n)=y2(n-1)+(k21+2*k22+2*k23+k24)/6;
    y3(n)=y3(n-1)+(k31+2*k32+2*k33+k34)/6;
    y4(n)=y4(n-1)+(k41+2*k42+2*k43+k44)/6;
    y5(n)=y5(n-1)+(k51+2*k52+2*k53+k54)/6;
    y6(n)=y6(n-1)+(k61+2*k62+2*k63+k64)/6;
    x(n)=x(n-1)+h;
end

%****************************************************************************
% The ‘k’ values are computed in each step and all the three variables, x, y1 %and y2 are computed for the next step.

end
