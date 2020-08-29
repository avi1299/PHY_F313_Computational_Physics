thnot=pi/6;u0=cos(thnot);R=0.02;g=10;
omegax0=15*pi;omegay0=15*pi;omegaz0=60*pi;
a=2*omegaz0/5;beta=8*g/(5*R);
b=sqrt(1-u0^2)*omegay0+a*u0;
alpha=omegax0^2+omegay0^2+beta*u0;
f=@(u)(alpha-beta*u)*(1-u^2)-(b-a*u)^2;
fphi=@(u)(b-a*u)/(1-u^2);
fpsi=@(u)5*a/2-u*fphi(u);
t0=0;h=0.00001;
t(1)=t0;u(1)=u0;

%***************************************************************
% The initial conditions as well as the three functions fu, fphi and fpsi are % defined above. 
%****************************************************************************

N=1;

while f(u(N))>0
    k1=-h*sqrt(f(u(N)));
    k2=-h*sqrt(f(u(N)+k1/2));
    k3=-h*sqrt(f(u(N)+k2/2));
    k4=-h*sqrt(f(u(N)+k3));
    N=N+1;
    u(N)=u(N-1)+(k1+2*k2+2*k3+k4)/6;
    u(N)=real(u(N));
    t(N)=t(N-1)+h;
end
 
%***************************************************************************
% The variable u is integrated from its initial value to its lowest value.  %That is why there is a negative sign before the function f(u). 
%***************************************************************************

N=N-1; 

while f(u(N))>0
    k1=h*sqrt(f(u(N)));
    k2=h*sqrt(f(u(N)+k1/2));
    k3=h*sqrt(f(u(N)+k2/2));
    k4=h*sqrt(f(u(N)+k3));
    N=N+1;
    u(N)=u(N-1)+(k1+2*k2+2*k3+k4)/6;
    u(N)=real(u(N));
    t(N)=t(N-1)+h;
end

%***************************************************************************
% The variable u is integrated from its lowest value to its highest value.  %That is why the negative sign is changed to positive before the function %f(u). 
%***************************************************************************
 
N=N-1;u(N);
 
while f(u(N))>0 && u(N)>u(1)
    k1=-h*sqrt(f(u(N)));
    k2=-h*sqrt(f(u(N)+k1/2));
    k3=-h*sqrt(f(u(N)+k2/2));
    k4=-h*sqrt(f(u(N)+k3));
    N=N+1;
    u(N)=u(N-1)+(k1+2*k2+2*k3+k4)/6;
    u(N)=real(u(N));
    t(N)=t(N-1)+h;
end

%***************************************************************************
% The variable u is integrated from its highest value to the initial value.  %That is why the sign is again changed to negative. This completes one full %cycle for the variable u.
%***************************************************************************
 
N=N-1;
 
phi(1)=0;psi(1)=0;
 
for n=2:N
    k1phi=h*fphi(u(n-1));
    k2phi=h*fphi(u(n-1)+k1phi/2);
    k3phi=h*fphi(u(n-1)+k2phi/2);
    k4phi=h*fphi(u(n-1)+k3phi);
    k1psi=h*fpsi(u(n-1));
    k2psi=h*fpsi(u(n-1)+k1psi/2);
    k3psi=h*fpsi(u(n-1)+k2psi/2);
    k4psi=h*fpsi(u(n-1)+k3psi);
    phi(n)=phi(n-1)+(k1phi+2*k2phi+2*k3phi+k4phi)/6;
    psi(n)=psi(n-1)+(k1psi+2*k2psi+2*k3psi+k4psi)/6;
end

u=real(u);phi=real(phi);,psi=real(psi);

%***************************************************************
% The variables phi and psi are integrated above using the %values of u obtained previously. Due to small errors the three %variables develop small imaginary parts as the square root of %f(u) is repeatedly calculated. These imaginary parts are weeded %out by taking their real parts. 
%***************************************************************
 
for m=1:25
    for n=1:N
        u(n+m*N)=u(n);
        phi(n+m*N)=phi(m*N)+phi(n);
        psi(n+m*N)=psi(m*N)+psi(n);
        t(n+m*N)=t(m*N)+n*h;
    end
end

%****************************************************************************
% The values of the variables, calculated for one cycle of u, is now repeated for may cycles above.
%****************************************************************************

x=sqrt(1-u.^2).*sin(phi);
y=-sqrt(1-u.^2).*cos(phi);
z=u;
%plot(t,phi)
grid on
comet(x,y)

%***************************************************************************
% The x,y & z coordinates are computed from u, phy and psi and plotted above.
