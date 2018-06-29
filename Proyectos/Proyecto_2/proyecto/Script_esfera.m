% Script: Esfera
% Juan P Aguilera 136078
% Luis M Rom�n    117077
% Madeleine Le�n  125154
%------------------------------------------
clear all; close all; clc;
fname = 'funelectron';
funh  = 'funesfera';
%------------------------------------------
% Almacenamos los resultados para la comparaci�n
maxiter    = 500;  % N�mero m�ximo de iteraciones.
resfmincon = zeros(5,4);
respscg    = zeros(5,5);
%------------------------------------------
% Iteraci�n
for np = 10:10:50
    % Puntos aleatorios
    x0 = rand(3*np,1);
    % Evaluamos desempe�o de fmincon (optimizador 
    % con restricci�nes interno de MATLAB)
    tic
    [~,fval,~,output,~,~]=fmincon(@funelectron,x0,[],[],...
    [],[],[],[],@funesfera2);
    time = toc;
    resfmincon(np/10,1) = np;
    resfmincon(np/10,2) = output.firstorderopt;
    resfmincon(np/10,3) = fval;
    resfmincon(np/10,4) = time;
    %------------------------------------------
    % Evaluamos desemepe�o de nuestro optimizador
    tic
    [x,fval,iter,lambda, fin] = pscglobal(fname, funh, x0, maxiter);
    time = toc;
    respscg(np/10,1) = np;
    respscg(np/10,2) = fin;
    respscg(np/10,3) = fval;
    respscg(np/10,4) = time;
    respscg(np/10,5) = iter;
end
%------------------------------------------
% Imprimimos resultados fmincon
fprintf(1,' no. puntos \t  ||L aum||  \t   f(x)   \t time \n')
fprintf(1,' %2.0f      \t   %2.8f     \t   %3.2f  \t %3.2f  \n', resfmincon')
fprintf(1,'\n\n')
%------------------------------------------
% Imprimimos resultados de nuestro optimizador
fprintf(1,'| no. puntos  \t ||L aum||   \t   f(x)  \t  time  \t  iter   \n')
fprintf(1,'| %2.0f       \t   %2.8f     \t  %3.2f  \t  %3.2f \t  %2f    \n', respscg')
%------------------------------------------
% Graf�camos resultados para la �ltima iteraci�n
figure
sphere(50);
axis equal
hold on
for j=1:np
   plot3(x(3 * (j - 1) + 1),x(3 * (j - 1) + 2),x(3 * (j - 1) + 3), 'sk', 'LineWidth', 6);
end


