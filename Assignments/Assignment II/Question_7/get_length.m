function [a,length,x,y1] = get_length(a,N,x0,xN,y_initial,y_final,alpha)
epsilon=0.001;
while(1)
    f1=@(t,y1,y2)y2;
    f2=@(t,y1,y2)a*sqrt(1+y2^2);
    %[x,y1,y2]=RK4(N,x0,xN,y_initial,alpha,f1,f2);
    [x,y1,~]=RK4(N,x0,xN,y_initial,alpha,f1,f2);
    if(abs(y1(N)-y_final)>epsilon)
       a=a-(y1(N)-y_final)/y_final*epsilon;
    else
        break;
    end
end
length=length_calc(x,y1);

    

end

