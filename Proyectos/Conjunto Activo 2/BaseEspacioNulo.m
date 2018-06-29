%
% Encontramos una base del espacio nulo de A.
%
% In:
% - A: matriz en R^mxn, m < n, rango(A) = m,
%      A = [B N], con B mxm no singular.
%
% Out:
% - Z:
%
% Natalia Orozco Urquijo, 111008
% Omar Trejo Navarro, 119711
% Juan Pedro Luengas Garcia, 119493
%
% Optimización Numérica
% Prof. Zeferino Parada
% Enero, 2015
%
function [Z] = BaseEspacioNulo(A)
    [m, n] = size(A);
    B = A(:, 1:m);
    N = A(:, m+1:n);
    Binv = inv(B);
    Z = [-Binv*N; eye(n-m)];
end
