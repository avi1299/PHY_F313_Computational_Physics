t0=0;N=499;tN=49;
x0=10;xdot0=0;
c=10;
%x=zeros(1,N);xdot=zeros(1,N);z=zeros(1,N);zdot=zeros(1,N);
f1=@(x,y1,y2)y2;
f2=@(x,y1,y2)-c*y1;
[x,y1,y2]=RK2_predict(N,t0,tN,x0,xdot0,f1,f2);
plot(x,y1)
hold

[x,y1,y2]=RK4(N,t0,tN,x0,xdot0,f1,f2);
plot(x,y1)