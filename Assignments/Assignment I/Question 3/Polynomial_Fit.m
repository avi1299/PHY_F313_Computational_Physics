function c = Polynomial_Fit(f,x,n)
    A=zeros(n+1,size(x,1));
    for i=1:(n+1)
        for j=1:size(x,1)
            A(i,j)=x(j,1)^(i-1);
        end
    end
c=(A*A')\(A*f);            
end

