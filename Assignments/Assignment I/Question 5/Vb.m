x=linspace(1,100,100);
x=x'
h=x(2)-x(1)
y=x.^5
coeff=ones(size(x,1),1);
FD=Forward_Difference(x,y)
FD=FD'
interpolated_y=ones(size(x,1),1)*FD(1);
for i=2:size(FD,1)
    for j=1:size(x,1)
        coeff(j)=coeff(j)*(j-1-i+2)/(i-1);
        interpolated_y(j)=interpolated_y(j)+coeff(j)*FD(i);
    end
end
interpolated_y
%Interpolated function plot
plot(x,interpolated_y);
hold on
%Actual function plot
%plot(x,y,'g');
scatter(x,y,'g');
hold off