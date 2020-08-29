x=linspace(-4*pi,4*pi,10)
y=2*x
p=polyfit(x,y,9)
%roots(p)/pi

%p=[1,0,-1]
%polyval(p,2)