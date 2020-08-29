%*************************************************************************
% This program solves the three-dimensional Laplace equation inside a cube,
% whos six faces are maintained at constant potentials.
%*************************************************************************
 
h=0.02;
M=1/h+1;N=1/h+1;P=1/h+1;
x=0:h:1;y=0:h:1;z=0:h:1;
V=zeros(M,N,P);
V(1,1:N,1:P)=10;V(M,1:N,1:P)=10;V(1:M,1,1:P)=10;
V(1:M,N,1:P)=10;V(1:M,1:N,1)=0;V(1:M,1:N,P)=0;
V1=V;
epsilon=0.00001;s=2*epsilon;p=1;
 
%*************************************************************************
% The step size above is h along all three axes. Potentials are set on all
% six faces.
%*************************************************************************
 
while s>epsilon
for m=2:M-1
    for n=2:N-1
        for p=2:P-1
        V(m,n,p)=(V(m-1,n,p)+V(m+1,n,p)+V(m,n-1,p)+V(m,n+1,p));
        V(m,n,p)=(V(m,n,p)+V(m,n,p-1)+V(m,n,p+1))/6;
        end
    end
end
s=abs(max(max(max(V-V1))));
V1=V;
p=p+1;
end
 
%**************************************************************************
%Laplace equation is solved iteratively, until convergence defined through
%epsilon.
%*************************************************************************
 
U=V(:,:,(P+1)/2);
%z=min(min(min(V)))
[X Y]=meshgrid(x,y);
mesh(X,Y,U)
