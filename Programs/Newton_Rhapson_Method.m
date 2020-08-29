F=@(x)cos(x)-x
Fdash=@(x)-sin(x)-1
x=pi/2
y=x-F(x)/Fdash(x)
epsilon=0.0001
count=1
while abs(y-x)>epsilon
    x=y
    y=x-F(x)/Fdash(x)
    count=count+1
end
disp(y)
disp(F(y))
count