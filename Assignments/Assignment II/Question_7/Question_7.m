starting_point=[0,0];
finishing_point=[10,4];
dist=sqrt(sum((finishing_point-starting_point).^2));
actual_length=2*dist;
epsilon=0.0001;
x0=starting_point(1);
xN=finishing_point(1);
y_initial=starting_point(2);
y_final=finishing_point(2);
N=1000;
a=0.4;
alpha=[];
alpha(1)=-3;alpha(2)=-5;
len=[];
[a,len(1),~,~] = get_length(a,N,x0,xN,y_initial,y_final,alpha(1));
i=2;
while(1)
    [a,len(i),x,y1] = get_length(a,N,x0,xN,y_initial,y_final,alpha(i));
    if(abs(len(i)-actual_length)>epsilon*actual_length)
       alpha(i+1)=alpha(i-1)+(actual_length-len(i-1))/(len(i)-len(i-1))*(alpha(i)-alpha(i-1));
    else
        break;
    end
    i=i+1;
end
plot(x,y1)
computed_length=len(numel(len))
actual_length

