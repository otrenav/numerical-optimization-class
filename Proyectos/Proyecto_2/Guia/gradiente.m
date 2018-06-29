%
% Gradiente de la funcion fname en x
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
function gfx = gradiente(fname, x)
    h   = 1e-06;
    fx  = feval(fname, x);
    n   = length(x);
    gfx = zeros(n, 1);
    for k = 1:n
        xt     = x;
        xt(k)  = xt(k) + h;
        fxh    = feval(fname, xt);
        gfx(k) = (fxh - fx)/h;
    end
end