function [ x] = Metodo_Espacio_Nulo_2( Q, A,c,b )
% Solución del problema
%   Min (1/2)*x'*Q*x + c'*x
% s. a.  A*x = b
% donde Q es nxn simétrica positiva definida
% A es mxn, m<n, rango(A) = m  y A = [ B  N] con B mxm no singular,
% c es nx1 y b es mx1,
% Se usa la descomposición en valores singulares

[m,n] = size(A);

[U,S,V] = svd(A);   % descomposición en valores singulares

Z = V(:,m+1:n);     % base ortonormal del espacio nulo de A

D = S(1:m,1:m);
dd = diag(D);
dd = 1./dd;

S1 = diag(dd);


Y = V*[ S1 ;zeros(n-m,m)]* U' ;  % A*Y = I_m

xp = Y*b;

R = Z'*Q*Z;  % simétrica positiva definida de orden(n-m)x(n-m)
ld = - Z'*(Q*xp +c);

% Resolvemos el sistema lineal R *xz = ld

 L = chol(R)';

 z = L\ld;
 xz = L'\z;
 
 x = xp + Z*xz;













