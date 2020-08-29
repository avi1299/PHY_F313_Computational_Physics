omegax=1;omegay=1;alpha=0.1;
f1=@(x1,x2)x2;
f2=@(x1,x2)-x1;
Tx=2*pi/omegax;Ty=2*pi/omegay;
n=1000000;
t=zeros(1,n);y1=zeros(1,n);y2=zeros(1,n);
y3=zeros(1,n);y4=zeros(1,n);
t0=0;tn=1*Ty;
h=(tn-t0)/(n-1);
y1(1)=0;y2(1)=0;y3(1)=0;y4(1)=omegay;
t=linspace(t0,tn,n);
for i=2:n
    y1(i)=y1(i-1)+h*f1(y1(i-1),y2(i-1));
    y2(i)=y2(i-1)+omegax*h*f2(y1(i-1),y2(i-1));
    y3(i)=y3(i-1)+h*f1(y3(i-1),y4(i-1));
    y4(i)=y4(i-1)+omegay*h*f2(y3(i-1),y4(i-1));
end
plot(y1,y3,'linewidth',1.5)