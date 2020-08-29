n=20;m=101;
%F is the funtion we want to plot
%n is number of sampled points and m is number of points we need tp plot
%the funvtion to compare with spline interpolated curve
F=@(x)exp(-x.^2);
x1=-pi;xn=pi;
x=linspace(x1,xn,n);
h=(xn-x1)/(n-1);
y=F(x);
plot(x,y,'r');
z=linspace(x1,xn,m);
plot(z,F(z));
a=zeros(1,n-1);
b=zeros(1,n-1);
c=y(1:(n-1));
hold on
a(1)=0;
b(1)=(y(2)-y(1))/h;
for i=2:n-1
    b(i)=2*(y(i)-y(i-1))/h-b(i-1);
    a(i)=(y(i+1)-y(i))/h^2-b(i)/h;
end
[a;b;c]
%Plotting each function of the spline
for i=1:n-1
    t=linspace(x(i),x(i+1));
    interpolated_y=a(i)*((t-x(i)).^2)+b(i).*(t-x(i))+c(i);
    plot(t,interpolated_y,'g')
    
end
Cubic_Spline_Interpolation(x1,xn,n,m,F);
%Blue is actual funtion;red is Cubic Spline;Green is Quadratic Spline
hold off

    