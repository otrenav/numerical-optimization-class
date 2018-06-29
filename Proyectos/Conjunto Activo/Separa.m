%
% Programacion Cuadratica Convexa
% Metodo: Region Activa
% Problema: Separacion lineal
%
% Omar Trejo Navarro, 119711
% Natalia Orozco Urquijo, 111008
% Juan Pedro Luengas Garcia, 119493
%
% Marzo, 2015
%
% Dr. Zeferino Parada
% Optimizacion Numerica
% ITAM
%

clear all;
close all;

load('Datos Separacion')
[m, col] = size(z);
[p, col] = size(y);

H  = [eye(col) zeros(col, 1); zeros(1, col) 0];
c  = zeros(col + 1, 1);
em = ones(m, 1);
ep = ones(p, 1);

% Se resuelve el problema cuadrático
%
%   min     (1/2)x'Qx+c'x
%   s.a.    Ax = b
%           Fx >= d

hold on
plot(z(:, 1), ...
     z(:, 2), '.r', ...
     y(:, 1), ...
     y(:, 2), '.b', ...
     'Linewidth',2)


% Agregamos 1 para que Q sea s.p.d.
Q = [eye(col) zeros(col,1); zeros(1,col) 1];
F = [-z -em; y ep];
d = [ep; em];
A = [];
b = [];
c = zeros(col+1,1);

%
% Conjunto Activo aplicado al
% problema de separacion lineal.
%
[w, beta, k] = ConjuntoActivo(Q, A, F, c, b, d)

%
% Grafica
%
tmin = min([z(:, 1); y(:, 1)]);
tmax = max([z(:, 1); y(:, 1)]);

t   = linspace(tmin, tmax)';
rt  = -(beta + w(1)*t)/w(2);
rt1 = -(beta + 1 + w(1)*t)/w(2);
rt2 = -(beta - 1 + w(1)*t)/w(2);

plot(t, rt, '--g', ...
     t, rt1, 'r', ...
     t, rt2, 'b', ...
     'Linewidth', 1)

title('Separación lineal', 'Fontsize', 14)