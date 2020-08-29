function I = Elliptical_Integral(k,phi)
 Fun = @(theta)1./sqrt(1-(k.^2).*(sin(theta)).^2);
 M=20;
syms r;
roots=solve(legendreP(M,r));
roots=double(roots);
p=(phi)/2; q=(phi)/2;
y=p*Fun(p*roots+q);
y=double(y);

z=diff(legendreP(M,r),r,1);
z=double(subs(z,r,roots));
w=2./((1-roots.^2).*(z.^2));
I=sum(w.*y);
end
