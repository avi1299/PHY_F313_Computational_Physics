%**************************************************************************
% This program computes the electric potential of a uniformly charged
% ellipsoid of radius R as a function of r, in a fixed direction (theta,phi)
% and compares it with a dipole with same moment.
%*************************************************************************
theta=pi/6;phi=pi/4;
h=0.1;
r1=1;r2=10;
M=(r2-r1)/h+1;
r=r1:h:r2;
 
V=zeros(1,M);
 
for m=1:M
 
X=r(m)*sin(theta)*cos(phi);Y=r(m)*sin(theta)*sin(phi);Z=r(m)*cos(theta);
f=@(x,y,z)1./sqrt((x-X).^2+(y-Y).^2+(z-Z).^2); 
R=1.0;
 
N=100000;
k=0;
 
for n=1:N
    x=-1+2*rand;
    y=-1+2*rand;
    z=sqrt(2)*(-1+2*rand);
    s=sqrt(x^2+y^2+z^2/2);
    if s<=1
        if z > 0
            V(m) = V(m) + f(x,y,z);
        else
            V(m) = V(m) - f(x,y,z);
        end
        k=k+1;
    end
end
 
V(m) = 4*sqrt(2)*pi*R^3*V(m)/(3*k);
end
Vdipole = pi*R^4*cos(theta)./(r.^2);
 
plot(r,V)
hold on 
grid on
plot(r,Vdipole,'r')
xlabel("Radius");
ylabel("Potential");
hold off