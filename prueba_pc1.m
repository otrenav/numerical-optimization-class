% Script file: Prueba_PC1.m
close all
tau = 0.5;
n = 800;
m = 350;

[Q,A,c,b] = Generapc(n,m,tau);



tic;[ x1, lambda ] = PCDirecto( Q,A,c,b ); toc
tic; [ x2, lambda ] = PCRango( Q,A,c,b ); toc
tic; [ x3] = Metodo_Espacio_Nulo_1( Q, A,c,b ); toc
tic; [ x4] = Metodo_Espacio_Nulo_2( Q, A,c,b ); toc

disp('Directo vs Rango')
s1 = norm(x1-x2)

disp('Directo vs Espacio Nulo')

s2 = norm(x1-x3)

disp('Rango vs Espacio Nulo')

s3 = norm(x2-x3)

disp('Espacio Nulo 1  Espacio Nulo 2')

s4 = norm(x3-x4)





