
%*********************************************************************
% This program computes the volume of a n-sphere by using Monte-Carlo
% integration and compares it with the exact value.
%*********************************************************************
 
N=11;M=1000000;k=0;
volumecuboid=2^N;
 
for n=1:M
    x= -1 + 2*rand(1,N);
    x=x.^2;
    s=sum(x);
    if s < 1
        k=k+1;
    end
end
 
volume = volumecuboid*(k/M)
 
pi^(N/2)/gamma(N/2+1)
