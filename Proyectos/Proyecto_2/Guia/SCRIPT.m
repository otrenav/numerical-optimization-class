%
% Proyecto 2
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

res_fmin = zeros(2, 4);
res_prop = zeros(2, 4);

opciones = optimoptions('fmincon', 'Display', 'off');

%
% Probamos con 10 y 20 puntos
%
for np = 10:10:20
    fprintf('\n#(puntos) = %d \n', np);
    x0 = rand(3*np, 1);
    
    %
    % Usando método de MATLAB (fmincon)
    %
    tic
    [~, fval, ~, output, ~, ~] = fmincon(@esfera_1, x0, ...
                                         [], [], [], [], [], [], ...
                                         @esfera_2, opciones);
    time = toc;

    res_fmin(np/10, 1) = np;
    res_fmin(np/10, 2) = fval;
    res_fmin(np/10, 3) = time;
    res_fmin(np/10, 4) = output.iterations;

    %
    % Usando método propio (SQP_BL)
    %
    tic
    [x, f, i] = SQP_BL('esfera_1', 'esfera_3', x0);
    t = toc;

    res_prop(np/10, 1) = np;
    res_prop(np/10, 2) = f;
    res_prop(np/10, 3) = t;
    res_prop(np/10, 4) = i;
end

%
% Resultados
%
fprintf('\n\nResultados fmincon\n')
fprintf(1,' #(puntos) \t f(x)    \t tiempo  \t iter \n')
fprintf(1,' %2.0f     \t %3.2f   \t %3.2f   \t %2d  \n', res_fmin')
fprintf(1,'\n')

fprintf('Resultados propios\n')
fprintf(1,' #(puntos) \t f(x)    \t tiempo  \t iter \n')
fprintf(1,' %2.0f     \t %3.2f   \t %3.2f   \t %2d  \n', res_prop')

%
% Gráfica
%
figure(2);
sphere(50);
axis equal;
hold on;
for j = 1:np
   plot3(x(3*(j - 1) + 1), ...
         x(3*(j - 1) + 2), ...
         x(3*(j - 1) + 3), ...
         'sk', 'LineWidth', 6);
end
