function [ hx ] = funesfera( x )
% Juan P Aguilera 136078
% Luis M Rom�n    117077
% Madeleine Le�n  125154
%------------------------------------------
% Funci�n de al esfera de radio 1.
%   
% In
% x.- vector de dimensi�n 3*np.
% Out
% hx.- vector de dimensi�n np.
n  = length(x);
np = floor(n / 3);
x  = x(1:3 * np);
hx = zeros(np, 1);
%------------------------------------------
for i = 1:np
    u = x(3 * (i - 1) + 1:3 * i);
    hx(i) = (norm(u) ^ 2) - 1;
end
end

