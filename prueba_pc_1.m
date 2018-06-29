%Script file: Prueba_PC1.m (Programacion Cuadratica)

tau = 0.5;
n = 800;
m = 350;

[Q,A,c,b] = Generapc(n,m,tau);
spy(A)

pause

tic; [ x1,lambda ] = PCDirecto( Q,A,c,b ); toc
tic; [ x2,lambda2 ] = PCRango( Q,A,c,b ); toc
tic; [ x3 ] = Metodo_NullSp_1( Q,A,c,b ); toc
tic; [ x4 ] = Metodo_NullSp_2( Q,A,c,b ); toc

disp('Directo vs Rango')
s1 = norm(x1 - x2)

disp('Directo vs Espacio Nulo')
s2 = norm(x1 - x3)

disp('Espacio Nulo vs Rango')
s3 = norm(x3 - x2)

disp('Espacio Nulo vs Rango')

s3 = norm(x3 - x2)

disp('Espacio Nulo vs Rango')
s3 = norm(x3 - x2)

disp('Espacio Nulo 1 vs Espacio Nulo 2')
s3 = norm(x3 - x4)
