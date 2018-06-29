function [gx, hx ] = funesfera2( x )
% Juan P Aguilera 136078
% Luis M Rom�n    117077
% Madeleine Le�n  125154
%------------------------------------------
% Funci�n de la esfera de radio 1.
% restricciones de igual , no existen desigualdades
% para usar en fmincon.m
%   
% In
% x.- vector de dimensi�n 3*np.
% Out
% hx.- vector de dimensi�n np.
%------------------------------------------
gx = [];
n  = length(x);
np = floor(n / 3);
x= x(1:3 * np);
hx = zeros(np, 1);
%------------------------------------------
for i = 1:np
    u     = x(3 * (i - 1) + 1:3 * i);
    hx(i) = (norm(u) ^ 2) - 1;
end
end

