%
% Jacobiana de la funcion fname en x
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
function Jx = jacobiana(fname, x)
    h  = 1e-06;
    n  = length(x);
    Fx = feval(fname, x);
    m  = length(Fx);
    Jx = zeros(m, n);
    for k = 1:n
        xh       = x;
        xh(k)    = xh(k) + h;
        Fxh      = feval(fname, xh);
        Jx(:, k) = (Fxh - Fx)/ h;
    end
end