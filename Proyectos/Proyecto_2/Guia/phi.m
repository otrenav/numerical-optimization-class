%
% Función phi
%
% Prof. Zeferino Parada
% Optimización Númerica
%
% Omar Trejo Navarro, 119711
% Juan Pedro Luengas Garcia, 119493
% Natalia Orozco Urquijo, 111008
% ITAM, 2015
%
%
function val = phi(fname, cname, x, m)
    val = feval(fname, x) + m*norm(feval(cname, x), 1);
end
