n=10;
x=linspace(0,2*pi,n);
y=sin(x);
z=0;
for k=1:n
    z=z+y(k)*Lagrange(n,k,pi/6,x)/Lagrange(n,k,x(k),x);
end
z
function y = Lagrange(n,k,x,z)
    y=1;
    for p=1:n
        if p~=k
            y=y*(x-z(p));
        end
    end
end

