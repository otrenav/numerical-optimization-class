function [ x ] = Metodo_NullSp_2( Q,A,c,b )
%Solucion del problema  
%   Min (1/2)*x'*Q*x + c'*x
%    sa  A*x = b
% donde Q es nxn spd
% A es mxnm, m<n, rango(A)=m y A = [B N] con B mxm no singular,
% c es nx1 y b es mx1
%Se usa descomposicion de valores singulares

[m,n] = size(A); %descomposicion de valores singulares

[U,S,V] = svd(A);

Z = V(:,m+1:n);

D = S(1:m,1:m);
dd = diag(D);
dd = 1./dd;

S1 = diag(dd);

Y = V*[S1; zeros(n-m,m)]*U';

xp = Y*b;

R = Z'*Q*Z; %spd (n-m)x(n-m)
ld = -Z'*(Q*xp + c);

%Resolvemos el sistema lineal R*xz = ld

L = chol(R);

z = L\ld;
xz = L'\z;

x = xp + Z*xz;

end

