F=@(x)cos(x)-x
left=0.0
right=pi/2
epsilon=0.0001
count=0
while (right-left)>epsilon
    middle=(right+left)/2
    if sign(F(left))==sign(F(middle))
        left=middle;
    else
        right=middle;
    end
    count=count+1
end
middle
F(middle)
count