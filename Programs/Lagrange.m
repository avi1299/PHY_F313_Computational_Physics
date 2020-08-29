function y = Lagrange(n,k,x,z)
    y=1;
    for p=1:n
        if p~=k
            y=y*(x-z(p));
        end
    end
end
