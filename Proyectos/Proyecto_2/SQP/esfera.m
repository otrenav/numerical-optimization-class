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
% x:  vector en R^3*np
% fx: escalar
%
function fx = esfera(x)
    n  = length(x);
    np = floor(n/3);
    x  = x(1:3*np);
    fx = 0;
    for i = 1:(np - 1)
        u = x(3*(i - 1) + 1:3*i);
        for j = i + 1:np
            v  = x(3*(j - 1) + 1:3*j);
            fx = fx + (1/norm(u - v));
        end
    end
end