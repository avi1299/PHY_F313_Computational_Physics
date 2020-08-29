%**********************************************************************
% The following program calculates temperature distribution inside a
% a potato (initially room temperature)and dipped in water, also at room
% temperature. The water is slowly heated until boiling. Then the potato is
% removed from the boiling water and kept at room temperature.
%**********************************************************************
 
R=0.04;k=0.05;
K=0.8;c=3390;rho=1070;
a=K/(c*rho);
M=101;
h=R/(M-1);
 
%************************************************************************
% R is the radius of the potato, K is its thermal conductivity, c its
% specific heat, and rho its mass density. M is the no. of discretization 
% points along the radial line and N that of time. k=0.05 is each time   
% step.
%************************************************************************
 
alpha=a*k/(h^2);
u0=100;
u_enough=70;
x=0:h:R;
%u=zeros(M,N);
u_room=10;
u(1:M,1)=u_room;
 
%**********************************************************************
% Room temperature is 10 degrees celsius, u0=100 is the temperature of
% the boiling water.
%**********************************************************************
subplot(2,2,1)

n=1;
while u(1,n)<u_enough
    for m=M-1:-1:2
        u(m,n+1)=(1-2*alpha)*u(m,n)+alpha*((m-2)*u(m-1,n)+m*u(m+1,n))/(m-1);
    end
    
    u(1,n+1)=u(2,n+1);
    
    if u(M,n)< u0
       u(M,n+1)=u(M,n)+k/4;
    else
        u(M,n+1)=u(M,n);
    end
    n=n+1;
    
end
HeatingStopIteration=n;
N=n;

hold on

for i=1:floor(N/4):N
plot(x,u(:,i),'Linewidth',1.5)
end
xlabel("Radius");
ylabel("Temperature while Heating");
hold off
%**********************************************************************
% The if-else statement above raises the temperature of potato from 10
% to 100 till centre is at u_enough degrees. The surface temperature 
% increases k/4 degrees in one time step of k seconds each. Thus, it checks
% if u(M,n) has reached u0.
%***********************************************************************

u0=u_room;
u_enough=u_room+5;
u(M,n)=u_room;
while u(1,n)>u_enough
    for m=M-1:-1:2
        u(m,n+1)=(1-2*alpha)*u(m,n)+alpha*((m-2)*u(m-1,n)+m*u(m+1,n))/(m-1);
    end
    
    u(1,n+1)=u(2,n+1);
    
    if u(M,n)> u0
       u(M,n+1)=u(M,n)-k/4;
        else u(M,n+1)=u(M,n);
    end
    n=n+1;
    
end

CoolingStopIteration=n;
subplot(2,2,2)
N=n;
hold on

for i=HeatingStopIteration-2:floor((N-HeatingStopIteration)/5):N
plot(x,u(:,i),'Linewidth',1.5)
end
xlabel("Radius");
ylabel("Temperature while Cooling");
hold off
%**********************************************************************
% The if-else statement above raises the temperature of potato from 100
% to 10 till centre is at u_room+5 degrees. The surface temperature 
% decreases k/4 degrees in one time step of k seconds each. Thus, it checks
% if u(M,n) has reached u_room.
%***********************************************************************

Heating_Time=k*(HeatingStopIteration-1)
Cooling_Time=k*(CoolingStopIteration-HeatingStopIteration-1)

%**********************************************************************
% The above code tells time taken to heat and cool
%***********************************************************************

subplot(2,2,[3,4])
for i=1:n
    time(i)=i*k;
end
plot(time,u(1,:),'Linewidth',1.5);
xlabel("Time");
ylabel("Temperature");
    
 
%***********************************************************************
% The temperature as a function of time
%***********************************************************************

