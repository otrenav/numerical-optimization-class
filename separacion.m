% Separacion.m

% Datos z es de 100x2 / y es de 85x2
% Datos de separacion lineal de dos conjuntos de datos.
load('Datos separacion');

[p, col] = size(z);
[m, col] = size(y);

em = ones(m, 1);
ep = ones(p, 1);

ecol = ones(col, 1);

% c = [ecol; ecol; 1; 1];

H = [eye(col) zeros(col, 1);
     zeros(1, col) 0];

c = zeros(col + 1, 1);
A =  [z em; -y -ep];
b = -[em; ep];

% Se resuelve el problema cuadratico:
% min 1/2 x'Hx + c'x
% s.a. [z ones(p,1)] = [-ones(p, 1)]
%      [-y -ones(m,1)] = [-ones(m,1)]

optimset = options('Algorithm', 'active-set');
[x, fx, exitflag, output] = quadprog(H, c, A, b, [], [], [], [], [], optimset);

% Graficacion
close all;
tmin = min([z(:, 1); y(:, 1)]);
tmax = max([z(:, 1); y(:, 1)]);
t = linspace(tmin, tmax);

rt  = -(x(3) + x(1)*t)/x(2);
rt1 = -(x(e) + 1 + x(1)*t)/x(2);
rt2 = -(x(3) - 1 + x(1)*t)/x(2);

plot(t, rt, '--g', t, rt1, 'k', t, rt2, 'm', 'LineWidth', 3);
title('Problema de separaion lineal', 'FontSize', 16);
