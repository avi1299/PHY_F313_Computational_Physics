%***********************************************************************
% This programs calculates the probability distribution for the final
% displacement of a random walker in the large ensemble limit, which, thus,
% reduces to a normal distribution. The ensemble size is M (number of
% random walkers and the number of steps is N.
%************************************************************************
 
N=20000;M=40000; %Change N to 100 to see 2nd result. Smaller N, higher
                 %probability to rach home
x=zeros(1,N);
%p=0.5;q=1-p;   % p and q are probabilities for step to the right and left
               % respectively.
               
for m= 1:M
    s=0;
for n=1:N
    if s>=0
        p=0.5/(1-0.5*s/N);
    else
        p=0.5;
    end
        q=1-p;
    r=rand;
    if r>=q
        s=s+1;
    else
        s=s-1;
    end
end
    x(m)=s;
end
 
 
x1=min(x);x2=max(x);
range=x1:1:x2; 
count=zeros(1,x2-x1+1);
 
for m=1:M
    count(x(m)-x1+1)=count(x(m)-x1+1)+1;
end
subplot(1,2,1)
plot(range,count,'b')
xlabel("Final Position");
ylabel("Number of Walkers");
Reached_home=0;
for i=1:length(range)
    if range(i)==N/2
        Reached_home=count(i)
    end
end
Prob=Reached_home/M
 
Q=40;      % Q is the number of steps over which count is averaged out
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

y=x1+Q/2:Q:x2-Q/2;
 
hold on
subplot(1,2,2);
plot(y,count1,'r')
xlim([x1 x2])
xlabel("Final Position");
ylabel("Averaged Number of Walkers Binwise");