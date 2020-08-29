%This program introduces voids in the 2D Ising lattice. The spin of a void
%is set 'zero'. There is phae transition only if the percentage of voids is
%1-3%. Beyond that, there is no phase transition.
 
N=100;K1=0;K2=0;K3=0;
for m=1:N
    for n=1:N
        x=rand;
        if x<=0.475
            M(m,n)=-1;
            K1=K1+1;
        elseif (0.475<x) && (x<=0.95)
            M(m,n)=1;
            K2=K2+1;
            else
                M(m,n)=0;
                K3=K3+1;
        end
    end
end
K1,K2,K3
sum(sum(M));
 
%M=ones(N,N);
 
J=1;KB=1;
 
Q=30000000;
P=30;
Mav=zeros(1,P);T=zeros(1,P);
 
for p=1:P
    T(p)=0.2*p;
 
for q=1:Q
    x=randi([1,N],1,2);
    m = x(1); n = x(2);
    
    if m==N
        mplus=1;
    else
        mplus=m+1;
    end
    
    if n==N
        nplus=1;
    else
        nplus=n+1;
    end
    
    if m==1
        mminus=N;
    else
        mminus=m-1;
    end
    
    if n==1
        nminus=N;
    else
        nminus=n-1;
    end
    
    delE=2*(J/KB)*M(m,n)*(M(mplus,n)+M(mminus,n)+M(m,nplus)+M(m,nminus));
    %delE=delE+2*(J1/KB)*M(m,n);
    
    r=rand;
    
    if r<1/(1+exp(delE/T(p)))
       M(m,n)=-M(m,n);
    end
    
end
 
Mav(p)=sum(sum(M))/N^2;
%Mav(p)=absMav(p);
    
    
end
 
 
plot(T,Mav,'*')
xlim([0 8])
ylim([-1.2 1.2])
xlabel('Temperature')
ylabel('Magnetic Moment/Lattice site')
grid on

