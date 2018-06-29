function fx = funelectron(x)
% Juan P Aguilera 136078
% Luis M Rom�n    117077
% Madeleine Le�n  125154
%------------------------------------------
% Funci�n potencial de np electrones sobre la esfera basada en la 
% ley de gravitaci�n de Newton.
% x: vector de tama�o 3*np
% fx: n�mero real
% -------------------------
n  = length(x);
np = floor(n / 3);
x  = x(1:3 * np);
fx = 0;
for i = 1:(np - 1)
    u = x(3 * (i - 1) + 1:3 * i);
    for j = i + 1:np
        v = x(3 * (j - 1) + 1:3 * j);
        fx = fx + (1 / norm(u - v));
    end
end