y10=30*pi/180;y30=60*pi/180;y20=0;y40=0;
t0=0;tN=99;N=50000;
m=1;l=1;g=9.8;k=g/l;
%x_list_1=zeros(1,N);
%y_list_1=zeros(1,N);
%x_list_2=zeros(1,N);
%y_list_2=zeros(1,N);
%x_2=@(theta1,theta2)len1*sind(theta1)+len2*sind(theta2);
%y_2=@(theta1,theta2)len1*(1-cosd(theta1))+len2*(1-cosd(theta2));
%x_1=@(theta1)len1*sind(theta1);
%y_1=@(theta1)len1*(1-cosd(theta1));
f1 = @(t,y1,y2,y3,y4) y2;
f2 = @(t,y1,y2,y3,y4) (1/(2 -(cos(y3-y1))^2))*(-y2^2*sin(y3-y1)*cos(y3-y1)-y4^2*sin(y3-y1)+k*(-2*sin(y1)+sin(y3)*cos(y3-y1)));
f3 = @(t,y1,y2,y3,y4) y4;
f4 = @(t,y1,y2,y3,y4) -cos(y3-y1)*f2(t,y1,y2,y3,y4)+y2^2*sin(y3 - y1)-k*sin(y3);
[t,y1,y2,y3,y4]=RK4(N,t0,tN,y10,y20,y30,y40,f1,f2,f3,f4);

pen_1_x = l*sin(y1);
pen_1_y = -1*cos(y1);

pen_2_x = pen_1_x + l*sin(y3);
pen_2_y = pen_1_y - l*cos(y3);

plot(pen_2_x,pen_2_y)
hold
plot(pen_1_x,pen_1_y)