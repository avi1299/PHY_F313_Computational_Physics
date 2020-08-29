t0=-50;tN=0;N=10000;
t=linspace(t0,tN,N);
Fun_x=@(u)cos(pi*u.^2/2);
Fun_y=@(u)sin(pi*u.^2/2);
xlist=zeros(1,N);
ylist=zeros(1,N);
M=10;
syms r;
roots=solve(legendreP(M,r));
roots=double(roots);
x_prev=0;y_prev=0;

z=diff(legendreP(M,r),r,1);
z=double(subs(z,r,roots));
w=2./((1-roots.^2).*(z.^2));

for i=2:N
    if(t(i)>50)
        break;
    end
    p=(t(i)-t(i-1))/2; q=(t(i)+t(i-1))/2;
    x_new=double(p*Fun_x(p*roots+q));
    y_new=double(p*Fun_y(p*roots+q));
    xlist(i)=sum(w.*x_new)+x_prev;
    ylist(i)=sum(w.*y_new)+y_prev;
    x_prev=xlist(i);
    y_prev=ylist(i);
end
I=(1/2.-xlist).^2+(1/2.-ylist).^2;
I=I*2;
plot(t,I);
%xlist=[-fliplr(xlist) xlist];
%ylist=[-fliplr(ylist) ylist];


%plot(xlist,ylist)
