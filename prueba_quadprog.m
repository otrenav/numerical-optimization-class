%
% Prueba_quadprog.m
%
% Estudiamos empiricamente el metodo de 
% conjunto activo con quadprog.
%

nc = 50; % Número de casos
tau = 0.85;
VT = zeros(nc, 1);

for k = 1:50
    n = 10*k;
    m = round(n/3);
    p = (6*n/7);
    [Q, A, F, c, b, d] = genera_pc1(n, m, p, tau);
    t = cputime;
    [x, fx, exitflag, output] = quadprgo(Q, c, -F, d, A, b);
    s = outtime - t;
    VT(k) = a;
end

plot([1:nc], VT, 'dr', 'LineWidth', 3)
title('CPUTIME DE CONJUNTO ACTIVO', 'FontSize', 16)
xlabel('Numero de problema', 'FontSize', 16)
ylabel('Segundos', )

%
% Nota: no hice esta parte pero el profesor corrió el algoritmo varias
% veces y graficó "Número de problema" vs. "Segundos" y "Número de problema"
% vs "Porcentaje" (no sé de qué). El algoritmo que se programó fue el de
% región activa (será un proyecto más adelante).
%
