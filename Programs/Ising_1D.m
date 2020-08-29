%This program is about 1D Ising model. There is no phase transition.
 
N=1000;       %N is the number of lattice sites in the 1D lattice.
 
for n=1:N
        x=rand;
        if x<=0.5
            M(n)=-1;
        else
            M(n)=1;
        end
end
 
 
M=ones(1,N);
 
J=1;
Q=10000000;
P=20;
Mav=zeros(1,P);T=zeros(1,P);
 
for p=1:P
    T(p)=0.5*p;
 
for q=1:Q
    n=randi([1,N]);
        
    if n==N
        nplus=1;
    else
        nplus=n+1;
    end
    
        
    if n==1
        nminus=N;
    else
        nminus=n-1;
    end
    
       
    delE=2*J*M(n)*(M(nplus)+M(nminus));
    
    r=rand;
    
    if r<1/(1+exp(delE/T(p)))
        M(n)=-M(n);
    end
    
    
end
 
Mav(p)=sum(sum(M))/N;
    Mav(p)=abs(Mav(p));
    
end
 
%Mav
 
 
plot(T,Mav,'*')
xlim([0 8])
ylim([0 1.5])
xlabel('Temperature')
ylabel('Magnetic moment/site')
