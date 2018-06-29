function [ xp ] = Sol_Particular( A,b )
%Solución particular de 
% A *x = b
% donde A es mxn, m<n y rango(A) = m.
%   El método es usando la pseudo inversa de A.

M = A*A';

L = chol(M)';  % factor de Cholesky triangular inferior con diagonal positiva

z = L\b;

w = L'\z;

xp = A'*w;
 


end

