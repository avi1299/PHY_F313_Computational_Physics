r0=1;rdot0=0.5;th0=0;thdot0=1;L=r0^2*thdot0;
k=1;p=2;
%*****************************************************************
%The above lines define r(0),rdot(0),theta(0) and thdot(0).
%They also define the power law of the central force(p)and 
%proportionality constant k of the central force. L is the constant
%angular momentum.
%******************************************************************
fr=@(r)-k*r^p;
f1=@(r,rdot)rdot;
f2=@(r,rdot)L^2/r^3+fr(r);
%*****************************************************************
%fr(r) above is the central force, f2 is the effective force, 
%the actual central force plus the ceintrifugal force.
%*****************************************************************
if p==-2
E=0.5*(rdot0^2+r0*thdot0^2)-k/r0;
e=sqrt(1+2*E*L^2/k^2);
a=-k/(2*E);b=a*sqrt(1-e^2);
T=2*pi*sqrt(a^3)/sqrt(k);
elseif p==1
    T=2*pi/k;
else
 T=2*5*pi/thdot0;       
end
%***********************************************************************
%Since for p=-2 and p=1, the orbit is closed and there is a definite 
%time period, the time of integration is taken to be one time period.
%For the other power laws the time of integration is chosen differently.
%***********************************************************************
t0=0;tN=T;
N=500000;
h=(tN-t0)/(N-1);
t=zeros(1,N);r=zeros(1,N);rdot=zeros(1,N);
theta=zeros(1,N);thdot=zeros(1,N);
r(1)=r0;rdot(1)=rdot0;
%**********************************************************************
%In the above, the number of iterations, step size 'h' r(0) and rdot(0)
%are defined.
%**********************************************************************
for n=2:N
    r(n)=r(n-1)+h*f1(r(n-1),rdot(n-1));
    rdot(n)=rdot(n-1)+h*f2(r(n-1),rdot(n-1));
end
%*********************************************************************
%The r-equation is integrated above by Euler method to get r(t) and 
%rdot(t).
%*********************************************************************
thdot=L./r.^2;theta(1)=th0;
for n=2:N
    theta(n)=theta(n-1)+h*thdot(n-1);
end
%********************************************************************
%The theta-equation is integrated by Euler method above.
%********************************************************************
x=r.*cos(theta);y=r.*sin(theta);
axis([-max(r) max(r) -max(r) max(r)]) 
hold on
%comet(x,y)
plot(x,y,'g','linewidth',1.5)
axis square
axis off
%********************************************************************
%The axes are defined and the trajectory plotted above. Plotting can be
%of two types, animated and final plot. Animation plotting is done by
%the command comet. One can switch between them.
%********************************************************************
 

