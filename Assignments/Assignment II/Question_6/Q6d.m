q=1;
m=1;
x0=0;N=1000;xN=49;
E0=0;B0=1;
vx0=10;xdot0=0;y0=0;ydot0=1;z0=0;zdot0=1;
z=zeros(N,1);
z(1)=z0;
h=(xN-x0)/(N-1);
for n=2:N
    z(n)=z(n-1)+h*zdot0;
end
%x=zeros(1,N);xdot=zeros(1,N);z=zeros(1,N);zdot=zeros(1,N);
f1=@(x,y1,y2,y3,y4)y2;
f2=@(x,y1,y2,y3,y4)q*E0/m-q*B0*y4/m;
f3=@(x,y1,y2,y3,y4)y4;
f4=@(x,y1,y2,y3,y4)q*B0*y2/m;
[x,y1,y2,y3,y4]=RK4(N,x0,xN,vx0,xdot0,y0,ydot0,f1,f2,f3,f4);
comet3(y1,y3,z)