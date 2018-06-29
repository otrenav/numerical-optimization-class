%
% Prueba 1: problema trivial chico.
%
G = [1 0; 0 1];
c = [0; 0];
A = [1 0; 0 1];
b = [1; 1];
[fx, x, W, lambda, k] = ConjuntoActivo(Q, A, F, c, b, d)

%
% Prueba 2: problema estandar chico (pg. 453).
%
% Solucion: x* = (2, -1, 1)' , lambda* = (3, -2)'
%
G = [6 2 1; 2 5 2; 1 2 4];
c = [-8; -3; -3];
A = [1 0 1; 0 1 1];
b = [3; 0];
[fx, x, W, lambda, k] = ConjuntoActivo(Q, A, F, c, b, d)

%
% Prueba 3: A de rango deficiente (pg. 475).
%
% Da error porque AA' no es positiva definida.
%
G = [1 0; 0 1];
c = [-2; -5];
A = [1 -2; -1 -2; -1 2; 1 0; 0 1];
b = [-2; -6; -2; 0; 0];
[fx, x, W, lambda, k] = ConjuntoActivo(Q, A, F, c, b, d)

%
% Prueba 4: problema mediano.
%
G = ;
c = ;
A = ;
b = ;
[fx, x, W, lambda, k] = ConjuntoActivo(Q, A, F, c, b, d)


%
% Problema 5: separacion (datos del Dr. Zeferino).
%
G = ;
c = ;
A = ;
b = ;
[fx, x, W, lambda, k] = ConjuntoActivo(Q, A, F, c, b, d)
