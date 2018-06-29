<<<<<<< HEAD
function [ x, lambda ] = PCDirecto( Q,A,c,b )
% Resolver el problema cuadrático
% Min (1/2)* x'*Q*x + c' * x
% s. a.  A*x = b
%   
% donde Q es nxn simétrica positiva definida
% A es mxn y rango(A) = m , m < n
% c es vector columna de orden n
% b es vector columan de orden m.

n = length(c);
m = length(b);

K = [Q  A'; A zeros(m)];
f = [-c;b];

[L, U] = lu(K);



v = L\f;
w = U\v;

x = w(1:n);
lambda = w(n+1:n+m);














end

=======
fucntion [x, lambda] = pcdirecto(Q, A, c, b)
    %
    % Resolver el problema cuadrÃ¡tico
    %   min 1/2* x'Qx + c'x
    %   s.a. A*x = b
    %
    % donde Q es nxn simÃ©trica positiva definida
    % A es mxn y rango(A) = m, m < n
    % c es vector columna de orden n
    % b es vector columna de orden m
    %
    n = length(c);
    m = length(b);
    K = [Q A'; A zeros(m)];

    % Para no modificar el l.d.
    % [L, U, P] = lu(K);
    % f1 = p'*f1;

    % [L, U] = lu(K);
    % f1 = p'*f;

    f = [-c; b];
    [L, U, P] = lu(K);

    f1 = p'*f;

    v = L\f1;
    w = U\v;
    x = w(1:n);
    lambda = w(n+1:n+m);
end
>>>>>>> Avances de proyecto.
