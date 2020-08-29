%**************************************************************************
% This program computes the electric potential of a uniformly charged disc
% of radius R as a function of r, in a fixed direction (theta,phi) and
% compares it with pure monopole contribution (Vmpole) as well as monopole
% and quadrupole contibution (Vtotal), by Monte-Carlo integration.
%*************************************************************************
 
R=1.0;
theta=pi/6;phi=pi/4;
h=0.1;
r1=1;r2=10;
N=100000;       
M=(r2-r1)/h+1;
r=r1:h:r2;
V=zeros(1,M);
 
for m=1:M
X=r(m)*sin(theta)*cos(phi);Y=r(m)*sin(theta)*sin(phi);Z=r(m)*cos(theta);
f=@(x,y)1./sqrt((x-X).^2+(y-Y).^2+Z.^2); 
 
k=0;
 
for n=1:N
    x=-1+2*rand;
    y=-1+2*rand;
    s=sqrt(x^2+y^2);
    if s<=1
    V(m)=V(m)+f(x,y);
    k=k+1;
    end
end
V(m) = pi*R^2*V(m)/k;
end
 
%*************************************************************************
% N is the number of randomly selected points within the square
% circumscribing the disc, and k is the number of points that fall inside
% the disc.
%*************************************************************************
 
Vmpole=pi*R^2./r;
 
Vqpole=(pi*R^4/8)*(1- 2*sin(theta)^2*sin(2*phi))./r.^3;
Vtotal=Vmpole+Vqpole;
 
hold on
plot(r,V,'b')
%plot(r,Vtotal,'g')
plot(r,Vmpole,'r')
hold off
