%*********************************************************************
% The following is the program that solves one-dimensional heat flow
% in a rod with Neumann BC (Heat flux defined at the ends.). The curved
% surface is insulated. You may remove the insulation and include heat
% loss due to air conduction and radiation.
%*********************************************************************
 
L=0.5;R=0.01;k=0.005;
K=385;c=385;rho=8960;
 
%********************************************************************
%L is the length of the rod, R is its radius, H is the heat transfer
%constant, K is thermal conductivit, c is specific heat, rho is mass
%density, all in SI unit for a copper rod.
%********************************************************************
 
a=K/(c*rho);
M=101;
h=L/(M-1);
r=a*k/(h^2);
T0=273;
x=0:h:L;
u(1:M,1)=400*x.*(L-x)/L^2+T0;
 
%********************************************************************
% M is the number if discretization points alog the rod, alpha, beta
%and gamma are as defined in the class, h is the step size of discre-
%tization. u(1:M,1) specifies the initial temperature profile. T0 is the
%surrounding temperature.
%********************************************************************
 
epsilon=1; % epsilon is the tolerance
N=1;
 
%********************************************************************
 
while abs(u((M-1)/2,N)-u(1,N))> epsilon
    u(1,N+1)=(1-2*r)*u(1,N)+2*r*u(2,N);
    u(M,N+1)=(1-2*r)*u(M,N)+2*r*u(M-1,N);
    for m=2:M-1
        u(m,N+1)=(1-2*r)*u(m,N)+ r*u(m-1,N)+r*u(m+1,N);
    end
    N=N+1;
end
 
%**********************************************************************
% The while and for loop above are used to move the temperature profile
% along the rod (index m) in time(index n) until the tempertaure becomes
% uniform within a tolerance of 1 degree.
%plot(x,u(:,N-10))
%**********************************************************************
 
T=k*(N-1)    % T is the total time required for the temperature to become
             % uniform to within one degree. Time is in seconds.
%***********************************************************************
 
plot(x,u(:,N))
y=linspace(0,T,N);
Z=u';
[X,Y]=meshgrid(x,y);
%mesh(X,Y,Z)
 
%***********************************************************************
% Both final u(x)as function of x, and u(x,t) as function of x & t are
% plotted in the above few steps.
 
