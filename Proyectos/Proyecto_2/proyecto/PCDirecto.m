function [ x, lambda ] = PCDirecto( Q,A,c,b )
% Juan P Aguilera 136078
% Luis M Rom�n    117077
% Madeleine Le�n  125154
%------------------------------------------
% Resolver el problema cuadr�tico
% Min (1/2)* x'*Q*x + c' * x
% s. a.  A*x = b
%   
% donde Q es nxn sim�trica positiva definida
% A es mxn y rango(A) = m , m < n
% c es vector columna de orden n
% b es vector columan de orden m.
n      = length(c);
m      = length(b);
K      = [Q  A'; A zeros(m)];
f      = [-c;b];
[L, U] = lu(K);
%------------------------------------------
v = L\f;
w = U\v;
%------------------------------------------
x = w(1:n);
lambda = w(n+1:n+m);
end

