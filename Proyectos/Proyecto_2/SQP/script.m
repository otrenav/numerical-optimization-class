%
% Proyecto 2 - SQP con BL
%
% Prof. Zeferino Parada
% Optimización Númerica
%
% Omar Trejo Navarro, 119711
% Juan Pedro Luengas Garcia, 119493
% Natalia Orozco Urquijo, 111008
%
clear all;
close all;
opciones   = optimoptions('fmincon', 'Display', 'off');

n = 20;
fprintf('\nPara %d puntos...\n\n', n);
x0 = rand(3*n, 1);

tic;
[x, f, i] = SQP_BL('esfera', 'esfera_restricciones', x0);
t = toc;

%
% Resultados
%
fprintf('Resultados\n');
fprintf(1, ' #(puntos) \t f(x)    \t tiempo  \t iter \n');
fprintf(1, ' %2.0f     \t %3.2f   \t %3.2f   \t %2d  \n', n, f, t, i);

%
% Gráfica
%
figure(2);
sphere(50);
axis equal;
hold on;
for j = 1:n
    plot3(x(3*(j - 1) + 1), ...
          x(3*(j - 1) + 2), ...
          x(3*(j - 1) + 3), ...
          'sg', 'LineWidth', 6);
    plot3(x0(3*(j - 1) + 1), ...
          x0(3*(j - 1) + 2), ...
          x0(3*(j - 1) + 3), ...
          'sr', 'LineWidth', 6);
    title('Puntos iniciales y finales', 'FontSize', 15);
end
