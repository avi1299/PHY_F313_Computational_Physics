%**************************************************************************
% This program is about wave motion in a string with both ends fixed with a
% bead a position 3L/4.
%*************************************************************************
 
T=0.1;mu=0.1;
c=sqrt(T/mu);
L=30;h=0.01;
bead_pos=L/4;
M=L/h+1;
x=linspace(-L/2,L/2,M);
bead_pos_M=0;
for i=1:M
    if x(i)<bead_pos
        bead_n=x(i+2);
        bead_p=x(i);
        bead_pos_M=i+1;
    end
end
k=0.01;
a=c*k/h;
%************************************************************************
% All the string parameters as well as step size for x (h) and that for t
% (k) are set above. T is the tension and mu is the mass per unit length.
%************************************************************************
 
u(1,:)=0;u(M,:)=0;
p=1+(L/2-1)/h;q=1+(L/2+1)/h;
u(p,1)=0;u(q,1)=0;
u(p,2)=0;u(q,2)=0;
 
%************************************************************************
% The initial shape of the string, a small pulse at the centre, are fixed
% above.
%************************************************************************
 
for n=p+1:q-1
u(n,1)=exp(-1/(1-x(n)^2));
u(n,2)=u(n,1)*(1+2*k*x(n)/((1-x(n)^2)^2));
end
 
%***********************************************************************
% Initial velocity profile of the string is set above.
%***********************************************************************
 
subplot(3,4,1)
plot(x,u(:,1),'r','Linewidth',1)
xlabel("X");
ylabel("Y");
axis([-L/2 L/2 -0.8 0.8])
 
for i=1:10
T(i)=2.5*i*2;
N(i)=T(i)/k+1;
u(1,:)=0;u(M,:)=0;
for n=2:N(i)
    for m=2:M-1
        if m==bead_pos_M
            u(m,n+1)=(u(m-1,n)+u(m+1,n))/2;
        else
        u(m,n+1)=a^2*(u(m+1,n)+u(m-1,n))+2*(1-a^2)*u(m,n)-u(m,n-1);
        end
    end
end
subplot(3,4,i+1)
plot(x,u(:,N(i)),'r')
xlabel("X");
ylabel("Y");
axis([-L/2 L/2 -0.8 0.8])
end
 
%*********************************************************************
% The equations are solved up to different time instants and the pulse
% position and shape plotted.
%*********************************************************************