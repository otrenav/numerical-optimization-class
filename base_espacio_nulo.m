<<<<<<< HEAD
function [ Z ] = Base_Espacio_Nulo( A )
% Encontramos una base del espacio nuloa de A
%  donde A es mxn, m <n, rango (A) = m   y
%  A = [ B  N] con B mxm no singular

[m,n] = size(A);

 B = A(:,1:m);
 N = A(:, m+1:n);
 
 Binv = inv(B);
 
 Z = [- Binv*N ; eye(n-m)];

end

=======
function [Z] = base_espacio_nulo(A)
    %
    % Encontramos una base del espacio nulo de A.
    %
    % In:
    % - A: mxn, m < n, rango(A) = m, A = [B N], con B mxm no singular
    %
    % Out:
    % - z:
    %
    % Omar Trejo Navarro
    %
    % Optimización Numérica
    % Prof. Zeferino Parada
    % Enero, 2015
    %

    [m, n] = size(A);
    B      = A(:, 1:m);
    N      = A(:, m+1:n)
    Binv   = inv(B);
    Z      = [-Binv*N; eye(n-m)];
end
>>>>>>> Avances de proyecto.
