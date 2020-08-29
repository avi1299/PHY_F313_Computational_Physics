F=@(x)x.^3./(exp(x)-1);
%Order of polynomial
order=8;
x=linspace(0.01,10,100);
x=x';
y=F(x)
rdcoeff=-10+20*rand(size(x,1),1);
rdcoeff=rdcoeff/100;
y=y+y.*rdcoeff;
c=Polynomial_Fit(y,x,order)
p=poly2sym(c)
interpolated_y=zeros(size(x,1),1);
for i=1:size(c,1)
    interpolated_y=interpolated_y+c(i,1)*x.^(i-1);
end
plot(x,interpolated_y);
xlim([0,10])
hold on
plot(x,y,'g');
hold off
