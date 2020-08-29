n=20;a=pi;m=101;
x=linspace(-a,a,n);p=30;
y=sin(p*x);
z=zeros(m);t=zeros(m);
for j=1:m
    t(j)=-a+2*a*(j-1)/(m-1);
    for k=1:n
        z(j)=z(j)+y(k)*Lagrange(n,k,t(j),x)/Lagrange(n,k,x(k),x);
    end
end
plot(t,z,'g','LineWidth',1.5);
hold on
plot(t,sin(p*t),'r','LineWidth',1.5)
hold off
grid on

function y = Lagrange(n,k,x,z)
    y=1;
    for p=1:n
        if p~=k
            y=y*(x-z(p));
        end
    end
end