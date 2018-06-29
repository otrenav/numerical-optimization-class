%
% Metodo de espacio nulo
%
% Omar Trejo Navarro, 119711
% Natalia Orozco Urquijo, 111008
% Juan Pedro Luengas Garcia, 119493
%
% Marzo, 2015
%
% Dr. Zeferino Parada
% Optimizacion Numerica
% ITAM
%
%     min 1/2 x'Gx + x'c
%     s.a. Ax = b
%
% In:
% - Q: matriz en R^nxn s.p.d.
% - A: matriz en R^mxnm de rango m,
%      A = [B N] con B en R^mxm no singular.
% - c: vector en R^n.
% - b: vector en R^m.
%
function [ x ] = MetodoEspacioNulo(Q, A, c, b)
    xp = solucion_particular(A, b);
    Z = base_espacio_nulo(A);
    R = Z'*G*Z; % s.p.d. en R^(n-m)x(n-m).
    ld = -Z'*(G*xp + c);
    L = chol(R);
    z = L\ld;
    xz = L'\z;
    x = xp + Z*xz;
end

