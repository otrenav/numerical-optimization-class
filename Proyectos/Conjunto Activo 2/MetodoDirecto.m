%
% Programacion Cuadratica Convexa
% Metodo: Region Activa
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
% Resolver el problema cuadrático
%     min 1/2* x'Gx + c'x
%     s.a. A*x = b
%
% In:
% - Q: matriz simetrica positiva definida de R^nxn.
% - A: matriz de R^mxn de rango m con m <= n.
% - c: vector en R^n.
% - b: vector en R^m.
%
% Out:
% - x: x*, vector de solucion optima en R^n.
%
function [x] = MetodoDirecto(Q, A, c, b)
    n = length(c);
    m = length(b);
    K = [Q A'; A zeros(m)];
    % Para no modificar el l.d.
    % [L, U, P] = lu(K);
    % f1 = p'*f1;
    % [L, U] = lu(K);
    % f1 = p'*f;
    f = [-c; b];
    [L, U, P] = lu(K);
    f1 = P'*f;
    v = L\f1;
    w = U\v;
    x = w(1:n);
    % lambda = w(n+1:n+m);
end
