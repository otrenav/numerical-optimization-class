function [ x] = Metodo_Espacio_Nulo_1( Q, A,c,b )
% Solución del problema
%   Min (1/2)*x'*Q*x + c'*x
% s. a.  A*x = b
% donde Q es nxn simétrica positiva definida
% A es mxn, m<n, rango(A) = m  y A = [ B  N] con B mxm no singular,
% c es nx1 y b es mx1,
% Se usa el esapcio nulo con
% (a) Solución particular de A*x = b con la pseudoinversa de A
% (b) base de Null(A) con la inversa de [B  N; zeros(n,m) eye(n)]

xp = Sol_Particular(A,b);
Z = Base_Espacio_Nulo(A);

R = Z'*Q*Z;  % simétrica positiva definida de orden(n-m)x(n-m)
ld = - Z'*(Q*xp +c);
% Resolvemos el sistema lineal R *xz = ld

 L = chol(R)';

 z = L\ld;
 xz = L'\z;
 
 x = xp + Z*xz;
 
 
 
 
 
 
 
 
 
 
 
end

