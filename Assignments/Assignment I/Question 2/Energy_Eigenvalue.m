function [Energy] =Energy_Eigenvalue(beta)
    %beta is 1 for particle mass =9.1*10^-31kg , width of well=10^-10m and
    %V=30eV
    %we can change V to change beta 
    width=10^-10;
    mass=9.1*10^-31;
    h=6.626*10^-34;
    h_=h/2/pi;
    %beta=width*sqrt(2*mass*V)/h_;
    V=(beta*h_/width)^2/2/mass;
    %FE is the even solution of the eighenvalue problem. FO is the odd
    %solution. The funtions takes parameter y=sqrt(X)where x is the value on 
    %the x axis defined by x=E/V
    FE=@(y)y*tan(beta*y)-sqrt(1-y^2);
    FO=@(y)-y*cot(beta*y)-sqrt(1-y^2);
    FEdash=@(y)beta*(sec(beta*y))^2+(1/y^2/sqrt(1-y^2));
    FOdash=@(y)beta*(csc(beta*y))^2+(1/y^2/sqrt(1-y^2));
    %The first solution is an even soultion. The following solutions alternate
    %between an even and odd one solution
    epsilon=0.000001;
    y=0.01;
    z=y-FE(y)/FEdash(y);
    while abs(z-y)>epsilon
        y=z;
        z=y-FE(y)/FEdash(y);
    end
    a=z;
    % a is the first soution
    y=z;
    z=y-FO(y)/FOdash(y);
    while abs(z-y)>epsilon
        y=z;
        z=y-FO(y)/FOdash(y);
    end
    b=z;
    %b is the second solution
    y=z;
    z=y-FE(y)/FEdash(y);
    while abs(z-y)>epsilon
        y=z;
        z=y-FE(y)/FEdash(y);
    end
    c=z;
    %c is the third soultion
    %we calulate the square to get x which is the ratio E/V.
    x_root=real([a b c]);
    x=(real([a b c])).^2;
    %We multiply by V to get the energy eigen values of the system.
    Energy=x*V;
   end
  




