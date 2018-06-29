%
% Programación cuadrática
%
% Resolver sistema cuadratico
% min 1/2 x'Qx + c'x
% s.a. Ax = b
%
% Prof. Zeferino Parada
% Optimización Númerica
%
% Omar Trejo Navarro, 119711
% Juan Pedro Luengas Garcia, 119493
% Natalia Orozco Urquijo, 111008
%
% ITAM, 2015
%
% Input:
% Q: matriz en R^nxn  s.p.d.
% A: matriz en R^mxn, rango(A) = m, m < n
% b: vector en R^m
% c: vector en R^n
%
% Output:
% x: vector en R^n
% l: vector en R^m
%
function [x, l] = QP(Q, A, c, b)
    n = length(c);
    m = length(b);
    K = [Q  A'; A zeros(m)];
    f = [-c; b];
    [L, U] = lu(K);
    v = L\f;
    w = U\v;
    x = w(1:n);
    l = w(n+1:n+m);
end

