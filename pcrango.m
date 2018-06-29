<<<<<<< HEAD
function [ x, lambda ] = PCRango( Q,A,c,b )
% Resolver, con el método del rango, el problema cuadrático
% Min (1/2)* x'*Q*x + c' * x
% s. a.  A*x = b
%   
% donde Q es nxn simétrica positiva definida
% A es mxn y rango(A) = m , m < n
% c es vector columna de orden n
% b es vector columan de orden m.

n = length(c);
m = length(b);

Q1 =inv(Q);    % cáluclo eficiente de la inversa

A1 = A*Q1*A';
g = -(A*Q1*c + b);
% sistema lineal A1*lambda = g;
%  A1 es simétrica positiva definida.
L = chol(A1)';
lambda = L'\(L\g);
x = -Q1*(c+A'*lambda  );





























=======
function [x, lambda] = pcrango(A, Q, c, b)
    %
    % Resolver el problema cuadratico
    %     min 1/2 x'Qx + c'x s.a. Ax = b
    % donde Q es nxn s.p.d., A es mxn y rango(A) = m, m < n
    % c es vector columna de orden n
    % b es vector columna de orden m
    %
    n = length(c);
    m = length(b);
    Q1 = inv(Q);
    A1 = A*Q1*A';
    g = -(A*Q1*c + b);
    % Sistema lineal A1*lambda - g;
    % A1 es simÃ©trica positiva definida.
    L = chol(A1);
    lambda = L'\(L\g);
    x = -Q1*(c + A'*lambda);
end
>>>>>>> Avances de proyecto.
