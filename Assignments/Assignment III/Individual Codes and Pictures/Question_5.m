%***********************************************************************
% This program generates the normal distribution from a unform distribution
% and compares it with the actual normal distribution.
%**************************************************************************
 
%sigma=1;mu=0;
Fun=@(x)x.*exp(-(x.^2))/(0.5 - 1/(2*exp(4)));
a=0;b=2;
h=0.0005;N=(b-a)/h+1;
x=a:h:b;
 
y(1)=Fun(x(1));
 
for n=2:N
    y(n)= y(n-1)+ h*Fun(x(n-1));
end
 
%*************************************************************************
% The for loop above generates the integrated values of the normal
% distribution.
%************************************************************************
 
M=50000;
 
for k=1:M
z=rand;
for m=1:N-1
    if y(m)<=z & y(m+1)>=z
        s(k)=x(m);
        break
    end
end
end
 
%***********************************************************************
% The above nested for loops map a random number y from a uniform
% distribution to the random number s statisfying normal distribution.
%***********************************************************************
 
binsize=400*h;
K=(b-a)/binsize;
bin=zeros(1,K);
w=a+binsize/2:binsize:b-binsize/2;
 
for k=1:M
    p=fix((s(k)-a)/binsize)+1;
    bin(p)=bin(p)+1;
end
 
% The above loop averages the distribution over a bin of size 'binsize'.
 
 
PDF = bin/(M*binsize);
 
 
hold on
plot(w,PDF,'o')
plot(x,Fun(x),'r')
xlabel("Distribution");
hold off
