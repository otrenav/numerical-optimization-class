function B = Powell(B, s, y)
% Juan P Aguilera 136078
% Luis M Rom�n    117077
% Madeleine Le�n  125154
%------------------------------------------
% actualizaci�n BFGS con idea de Powell
% B: aproximaci�n de la matriz hessiana
% s: vector columna de orden n distinto de cero
% y: vector columna de orden n distinto de cero
%------------------------------------------
angulo = s' * y;
Bangulo = s' * B * s;
%------------------------------------------
if (angulo < 0.2 * Bangulo)
    theta = 0.8 * Bangulo/(Bangulo - angulo);
else
    theta = 1;
end
r = theta * y + (1 - theta) * B * s;
B = B - (B * s * s' * B)/(s' * B * s) + r * r'/(s' * r);
end