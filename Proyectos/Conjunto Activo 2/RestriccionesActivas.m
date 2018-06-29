%
% Encontrar las soluciones activas relacionadas
% a un vector x en R^n para Ax=b.
%
% In:
% - A: matriz en R^mxn, m < n, rango(A) = m
% - b: vector en R^m
% - x: vector en R^n t.q. Ax=b
%
% Out:
% - xp: Yb = A'inv(AA')b
%       w = inv(AA')b => xp = A'w
%
% Omar Trejo Navarro, 119711
% Natalia Orozco Urquijo, 111008
% Juan Pedro Luengas Garcia, 119493
%
% Optimización Numérica
% Prof. Zeferino Parada
% Enero, 2015
%
function [ W ] = RestriccionesActivas(A, b, x)
    W = [];
    [m, n] = size(A);
    for i = 1:m
        aix = A(i,:)*x;
        bi = b(i);
        if aix == bi
            W = [W; i];
        end
    end
end

