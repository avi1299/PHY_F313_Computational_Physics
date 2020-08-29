l=1;g=9.8;
alphalist = linspace(10,170,17)*pi/180;
Tlist=zeros(1,17);
for i=1:17
    alpha=alphalist(i);
    %k = sind(alpha/2);
    T = 4*sqrt(l/g)*Elliptical_Integral(sin(alpha/2),pi/2);
    Tlist(i)=T;
end
plot(alphalist*180/pi,Tlist);
