len=9;
t=posixtime(datetime('now'))*1000;
seed=mod(t,1000);
num=zeros(1,len);
for i = 1:len
    random = seed^2;
    random = random/100;
    random = rem(random,10000);
    seed = random;
    num(i)=random;
end
num=floor(num);
for i=1:len
    sum=0;
    n=num(i);
    while(n>0)
        sum=sum+mod(n,10);
        n=floor(n/10);
    end
    if mod(sum,2)==0
        num(i)=-mod(num(i),1001);
    else
        num(i)=mod(num(i),1001);
    end
end
num
% 1b)Sorting it in increasing order
for i=1:len
    for j=(i+1):len
        if (num(i)>num(j))
            temp=num(i);
            num(i)=num(j);
            num(j)=temp;
        end
    end
end
num
% 1c)Finding the largest and smallest element, the mean, median and standard deviation
small=num(1)
large=num(len)
average=mean(num)
%midd=median(num)
if mod(len,2)==1
    middle=num(floor(len/2)+1)
else
    middle=mean(num(floor(len/2)+1),num(floor(len/2)))
end
std_dev=std(num)