%***********************************************************************
% This programs calculates the probability distribution for the final
% displacement of a random walker in the large ensemble limit, which, thus,
% reduces to a normal distribution. The ensemble size is M (number of
% random walkers and the number of steps is N.
%************************************************************************
 
N=20000;M=40000;
x=zeros(1,N);
p=0.5;q=1-p;   % p and q are probabilities for step to the right and left
               % respectively.
               
for m= 1:M
    s=0;
for n=1:N
    r=rand;
    if r>=q
        s=s+1;
        x(m)=s;
    else
        s=s-1;
        x(m)=s;
    end
end
 
end
 
 
x1=min(x);x2=max(x);
 
count=zeros(1,x2-x1+1);
 
for m=1:M
    count(x(m)-x1+1)=count(x(m)-x1+1)+1;
end
 
Q=50;      % Q is the number of steps over which count is averaged out
           % to smoothen the PDF.
           
count=count(1:1:x2-x1+1);
 
j=fix((x2-x1)/Q);
 
count1=zeros(1,j);
 
for i=1:j
    for k=1:Q
    count1(i)=count1(i)+ count(Q*(i-1)+k);
    end
    count1(i)=count1(i)/(M*Q/2);
end
 
 
ybar=N*(p-q); 
 
 
y=x1+Q/2:Q:x2-Q/2;
 
 
hold on
plot(y,count1,'b')
 
PN=exp(-((y-ybar).^2)/(8*N*p*q))/(sqrt(2*pi*N*p*q));
 
plot(y,PN,'r','linewidth',1.0)
 
xlim([x1 x2])
