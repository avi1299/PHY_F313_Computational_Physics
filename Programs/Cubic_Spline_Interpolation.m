m=101;n=9;k=3;  % Here n is the no. of data points and m is the no. of 
                 % interpolated points. 
% The coefficients a(i),b(i),c(i) of the linear equations to be solved
% to ontain the alphas as well as the RHS vector of the matrix equation
%are computed in the following block.
%**********************************************************************
x1=-pi;xn=pi;
x=linspace(x1,xn,n);
h=(xn-x1)/(n-1);
y=exp(-x.^2);
z=zeros(1,n-2);
for i=1:n-2
    z(i)=(y(i+2)-2*y(i+1)+y(i));
end
z=6*z/(h^2);
a=[0 ones(1,n-3)];
b=4*ones(1,n-2);
c=[ones(1,n-3) 0];
%********************************************************************
% The alphas as well as the coefficients p(i),q(i),r(i) and s(i) of 
% the interpolating cubic polynomials are computed below by calling  
% the function 'ThomasAlgo' in the following block.
%********************************************************************
alpha=ThomasAlgo(n-2,a,b,c,z);
alpha=[0 alpha];
p=zeros(1,n-1);q=zeros(1,n-1);r=zeros(1,n-1);s=zeros(1,n-1);
for i=1:n-1
    p(i)=(alpha(i+1)-alpha(i))/(6*h);
    q(i)=alpha(i)/2;
    r(i)=(y(i+1)-y(i))/h-h*(2*alpha(i)+alpha(i+1))/6;
    s(i)=y(i);
end
%*********************************************************************
% The interpolated values at m number of points by using Cubic Spline
% interpolation are computed in the following block.
%********************************************************************
t=linspace(x1,xn,m); 
w=zeros(1,m);
for i=1:m
n1=1+fix((t(i)-x1)/h);
if n1==0
    n1=n1+1;
end
if n1==n
    n1=n1-1;
end
w(i)=p(n1)*(t(i)-x(n1))^3+q(n1)*(t(i)-x(n1))^2+r(n1)*(t(i)-x(n1))+s(n1);
end
%**********************************************************************
%The following block  part does polynomial interpolation. 
% Interpolated values are stored in vector G.
%***********************************************************************
G=zeros(1,m);
for i=1:m
for j=1:n
    G(i)=G(i)+y(j)*Lagrange(j,n,t(i),x)/Lagrange(j,n,x(j),x);
end
end
%*******************************************************************
% Both the spline interpolation and the polynomial interpolation are
% plotted against the actual function for comparision below.
%*******************************************************************
subplot(1,2,1)
plot(t,w,'g','linewidth',1.5)
hold on
plot(t,exp(-t.^2),'r','linewidth',1.5)
hold off
subplot(1,2,2)
plot(t,G,'b','linewidth',1.5)
hold on
plot(t,exp(-t.^2),'r','linewidth',1.5);
hold off
%******************************************************************
