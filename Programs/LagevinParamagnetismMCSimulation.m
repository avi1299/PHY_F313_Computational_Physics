%***********************************************************************
% This program solves the classical paramagnetism (Langevin theory) by
% Monte-Carlo method.
%***********************************************************************
 
h=0.1;x0=8;   % The total magnetic moment is calculated for the parameter
              % x = (mu*B/kT) between - x0 and x0 with step size h.
N=2*x0/h+1;
x=-x0:h:x0;
y=zeros(1,N);
M=10000;      % M is the number of magnetic spins, each of moment 'mu'.
 
for n=1:N
    if x(n)==0
       y(n)=0;
    else
    
    for m=1:M
    y(n)=y(n)+log(exp(-x(n))+2*rand*sinh(x(n)))/x(n);
    end
    end
    
end
 
plot(x,y,'r','linewidth',1)
 
grid on
    
xlabel('parameter x')
ylabel('Total Magnetic Moment')
