function finalt=Time_Calculate(theta0)
thetadot0=0;
t0=0;tN=49;N=1000;
length=1;g=9.8;
timelist=[];
x_list=zeros(1,N);
y_list=zeros(1,N);
x=@(theta)length*sind(theta);
y=@(theta)length*(1-cosd(theta));
f1=@(t,theta,thetadot)thetadot;
f2=@(t,theta,thetadot)-g/length*sind(theta);
[t,y1,y2]=RK4_2(N,t0,tN,theta0,thetadot0,f1,f2);
for i=1:N
    x_list(i)=x(y1(i));
    y_list(i)=y(y1(i));
end
j=1;
for i=2:N
    if sign(y2(i))~=sign(y2(i-1))
        timelist(j)=t(i-1);
        j=j+1;
    end
end
k=numel(timelist);
for i=2:k
    timelist(k-i+2)=timelist(k-i+2)-timelist(k-i+1);
end
timelist(1)=[];
finalt=sum(timelist)/numel(timelist);


        
%ax=axes;
%set(ax,'xlim',[-1 1],'ylim',[0 2]);
%axis equal;
%axis([-1 1 0 2])
%hold (ax)
%comet(ax,x_list,y_list);