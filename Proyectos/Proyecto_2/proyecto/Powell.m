function B = Powell(B, s, y)
% Juan P Aguilera 136078
% Luis M Román    117077
% Madeleine León  125154
%------------------------------------------
% actualización BFGS con idea de Powell
% B: aproximación de la matriz hessiana
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