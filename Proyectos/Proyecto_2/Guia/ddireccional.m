%
% Derivada direccional
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
function gfx  = ddireccional(phi, fname, cname, x, m, p)
    h     = 1e-06;
    phix  = feval(phi, fname, cname, x, m);
    n     = length(x);
    ddir  = zeros(n, 1);
    for k = 1:n
        xt      = x;
        xt(k)   = xt(k) + h*p;
        phixh   = feval(phi, fname, cname, xt, m);
        ddir(k) = (fxh - fx)/h;
    end
end