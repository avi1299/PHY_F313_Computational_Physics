%In this program, the right end of the string is free to move vertically.
%The rest is the same as in the previous code.
%***********************************************************************
 
c=1;
L=30;h=0.01;
M=L/h+1;
x=linspace(-L/2,L/2,M);
k=0.01;
a=c*k/h;
 
u(1,:)=0;u(M,:)=0;
p=1+(L/2-1)/h;q=1+(L/2+1)/h;
u(p,1)=0;u(q,1)=0;
u(p,2)=0;u(q,2)=0;
 
for n=p+1:q-1
u(n,1)=exp(-1/(1-x(n)^2));
u(n,2)=u(n,1)*(1+2*k*x(n)/((1-x(n)^2)^2));
end
 
subplot(3,4,1)
plot(x,u(:,1),'r','Linewidth',1)
axis([-L/2 L/2 -0.8 0.8])
 
for i=1:10
T(i)=5*i;
N(i)=T(i)/k+1;
u(1,:)=0;u(M,1)=0;u(M,2)=0;
for n=2:N(i)
    u(M,n+1)=a^2*(2*u(M-1,n)-u(M,n-1))+2*(1-a^2)*u(M,n);
    for m=2:M-1
        u(m,n+1)=a^2*(u(m+1,n)+u(m-1,n))+2*(1-a^2)*u(m,n)-u(m,n-1);
    end
end
subplot(3,4,i+1)
plot(x,u(:,N(i)),'r')
axis([-L/2 L/2 -0.8 0.8])
end
