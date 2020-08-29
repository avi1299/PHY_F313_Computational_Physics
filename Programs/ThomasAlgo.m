function x = ThomasAlgo(n,a,b,c,y)
gamma=zeros(1,n+1);beta=zeros(1,n+1);
for i=1:n
    gamma(i+1)=-c(i)/(a(i)*gamma(i)+b(i));
    beta(i+1)=(y(i)-a(i)*beta(i))/(a(i)*gamma(i)+b(i));
end
x(n+1)=0;
for i=n+1:-1:2
    x(i-1)=gamma(i)*x(i)+beta(i);
end
end
