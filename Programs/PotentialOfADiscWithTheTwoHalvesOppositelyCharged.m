
%**************************************************************************
% This program computes the electric potential of a charged disc, one half
% of which carries a positive uniform charge density and the other a
% negative density. Comparison is made with the dipole contribution as the
% monopole moment is zero.
%*************************************************************************
 
theta=pi/6;phi=pi/4;
h=0.1;
r1=1;r2=10;
M=(r2-r1)/h+1;
r=r1:h:r2;
 
V=zeros(1,M);
 
for m=1:M
 
X=r(m)*sin(theta)*cos(phi);Y=r(m)*sin(theta)*sin(phi);Z=r(m)*cos(theta);
f=@(x,y)1./sqrt((x-X).^2+(y-Y).^2+Z.^2); 
R=1.0;
 
N=100000;
k=0;
 
for n=1:N
    x=-1+2*rand;
    y=-1+2*rand;
    s=sqrt(x^2+y^2);
    if s<=1
    if y > 0
        V(m) = V(m) + f(x,y);
    else
        V(m) = V(m) - f(x,y);
    end
    k=k+1;
    end
end
 
V(m) = pi*R^2*V(m)/k;
end
Vdipole = 4*R^3*sin(theta)*sin(phi)./(3.*r.^2);
 
hold on
plot(r,V)
plot(r,Vdipole,'r')
