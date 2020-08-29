len=10;
x=linspace(1,10,len);
x=x'
y=x.^2
rdcoeff=-10+20*rand(len,1);
rdcoeff=rdcoeff/100;
y=y+y.*rdcoeff
c=Polynomial_Fit(y,x,2)
p=poly2sym(c)
interpolated_y=zeros(size(x,1),1);
for i=1:size(c,1)
    interpolated_y=interpolated_y+c(i,1)*x.^(i-1);
end
plot(x,interpolated_y);
hold on
scatter(x,y,'g');
hold off
