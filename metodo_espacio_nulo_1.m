function [x] = metodo_espacio_nulo_1(Q, A, c, b)
    %
    % Solución del problema
    %
    % min 1/2 x'Qx + c'x
    % s.a. Ax = b
    %
    % Se usa el espacio nulo con:
    % a) Solución particular de Ax=b con la pseudo-inversa de A.
    % b) Base de null(A) con la inversa de [B N; zeros(n, m) eye(n)];
    %
    % In:
    % - Q: nxn s.p.d.
    % - A: mxn, m < n, rango(A) = m, A = [B N], con B mxm no singular
    % - c: nx1
    % - b: mx1
    %
    % Out:
    % - x:
    %
    % Omar Trejo Navarro
    %
    % Optimización Numérica
    % Prof. Zeferino Parada
    % Enero, 2015
    %

    % TODO: Gradiente conjugado por la dimensión de los problemas.

    xp = sol_particular(A, b);
    z  = base_espacio_nulo(A);
    R  = Z'*Q*Z;                    % s.p.d. de (n-m)x(n-m)
    ld = -Z'*(Q*xp + c);
    L  = chol(R)';                  % Resolvemos el sistema lineal R*xz = ld
    z  = L\ld;
    xz = L'\z;
    x  = xp + z*xz;
end
