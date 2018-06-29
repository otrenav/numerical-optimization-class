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
% x: vector en R^3*np
%
% Output:
% hx: vector en R^np
%
function [gx, hx] = esfera_2(x)
    gx = [];
    n = length(x);
    np = floor(n/3);
    x = x(1:3*np);
    hx = zeros(np, 1);
    for i = 1:np
        u = x(3*(i - 1) + 1:3*i);
        hx(i) = (norm(u)^2) - 1;
    end
end

