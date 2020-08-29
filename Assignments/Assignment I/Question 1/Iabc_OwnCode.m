% 1a)Generating an array of random numbers between -1000 and +1000
format longG
len=9; 
t_sum=0;
t_prev=0;
num=zeros(1,len);
for i=1:len
    pause(t_prev/1000);
    t_prev=0;
    t=posixtime(datetime('now'))*1000+t_sum;
    num(i)=mod(t,1001);
    t=floor(t/10);
    if mod(t,2)==0
        num(i)=-num(i);
    end
    while t>0
        t_prev=t_prev+mod(t,10);
        t=floor(t/10); 
    end
    t_sum=t_sum+t_prev;
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

            
            
        
