%En is the energy eigenvalue of infinite potential well
width=10^-10;
mass=9.1*10^-31;
h=6.626*10^-34;
h_=h/2/pi;
En=@(n)(n*h)^2/8/mass/width^2;
E=zeros(18,3);
j=1;
%We change value of beta from 10 to 100 in steps of 5
for beta=10:5:100
    E(j,:)=Energy_Eigenvalue(beta);
    j=j+1;
end
E
Energy_of_Infinite_Well=[En(1),En(2),En(3)]