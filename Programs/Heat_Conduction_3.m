%********************************************************************
% This program calculates the temperature distribution as a function
% of time inside a rod whose two ends are maintained at constant 
% temperature. The curved surface may/may not be insulated. 
%********************************************************************
 
L=0.5;R=0.01;H=30;k=0.005;
K=385;c=385;rho=8960;
sigma=5.67e-08;
 
%********************************************************************
%L is the length of the rod, R is its radius, H is the heat transfer
%constant, K is thermal conductivit, c is specific heat, rho is mass
%density, all in SI unit for a copper rod.
%********************************************************************
 
a=K/(c*rho);
M=101;
h=L/(M-1);
beta=2*H*k/(c*rho*R);gamma=2*k*sigma/(c*rho*R);
r=a*k/(h^2)
T0=273;
x=0:h:L;
u(1:M,1)=400*x.*(L-x)/L^2+T0;
 
%********************************************************************
% M is the number of discretization points alog the rod, beta and
%gamma concern heat loss due to diffusion and radiation respectively.
% Setting beta and gamma to zero insulates the curved surface of the
% rod. h is the step size of discretization. u(1:M,1) gixes the initial 
%temperature profile. T0 is the surrounding temperature.
%********************************************************************
 
epsilon=1; % epsilon is the tolerance
N=1;
 
%********************************************************************
 
while u(50,N)> T0+epsilon
    u(1,N)=T0;u(M,N)=T0;
    for m=2:M-1
        u(m,N+1)=(1-2*r)*u(m,N)-beta*(u(m,N)-T0)+r*u(m-1,N)+r*u(m+1,N);
        u(m,N+1)=u(m,N+1)-gamma*u(m,N)^4;
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
 
y=linspace(0,T,N);
Z=u';
[X,Y]=meshgrid(x,y);
mesh(X,Y,Z)
 
% The mesh plotting is done in the above four steps.
