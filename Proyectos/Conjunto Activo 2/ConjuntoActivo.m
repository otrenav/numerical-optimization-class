%
% Programacion Cuadratica Convexa
% Metodo: Region Activa
%
% Omar Trejo Navarro, 119711
% Natalia Orozco Urquijo, 111008
% Juan Pedro Luengas Garcia, 119493
%
% Marzo, 2015
%
% Dr. Zeferino Parada
% Optimizacion Numerica
% ITAM
%
% El algoritmo que programamos aqui es el que se
% encuentra en Nocedal - "Numerical Optimization",
% pg. 472, para resolver el problema:
%
%     min 1/2 x'Qx + x'c
%     s.a. Ax = b
%          Fx >= d
%
% In:
% - Q: matriz simetrica positiva definida en R^nxn.
% - A: matriz en R^mxn de rango m con m <= n.
% - F: matriz en R^sxn.
% - c: vector en R^n.
% - b: vector en R^m.
% - d: vector en R^s.
%
% Out:
% - fx: valor de f(x*) en R.
% - x: x*, vector de solucion optima en R^n.
% - W: conjunto de restricciones activas en x*.
% - lambda: vector de lambdas en la solucion optima.
% - k: numero de iteraciones realizadas.
%
function [fx, x, W, lambda,k] = ConjuntoActivo(Q, A, F, c, b, d)
    k = 0;
    kmax = 500;
    tol = 1e-5;
    lambda = -1;

    % [x, W] = fase_uno(F, d);

    % Solucion inicial
    options = optimset('Display', 'none');
    x = linprog(c, -F, -d, A, b, [], [], [], options);

    fprintf('\n iter \t f(x)\n')
    fprintf('----------------------\n')
    while (any(lambda < 0) && k <= kmax)
        % Resolver el subprolema (16.39):
        %     p = argmin (1/2)p'Gp + g'p
        %     s.a. ai'p = 0 con i en W
        g = G*x + c;
        Fsub = F(W, :);
        dsub = zeros(size(Fsub, 1), 1);

        % p = metodo_espacio_nulo(G, g, Fsub, dsub);
        p = metodo_directo(G, g, Fsub, dsub);

        if (norm(p) <= tol)
            % Resolver la ecuacion (16.42) para lambda:
            %     Fsub*lambda = g = Gx + c
            % lambda = Fsub'\g;
            lambda = solucion_particular(Fsub, g);

            if (any(lambda < 0))
                % Nota: cuidado con las que restricciones
                % de desigualdad (las que estan en I).
                [~, i] = min(lambda)
                W = W(W ~= i);
            end
        else
            % Calcular alpha para
            % i fuera de W y ai'pk < 0:
            D = (d - F*x)./(F*p);
            idx = find(F*p > 0);
            D(idx) = inf;
            D(W) = inf;
            alpha = min(1, min(D));
            x = x + alpha*p;
            if (any(F*x == d))
                i = find(F*x == d);
                W = [W; i];
            end
        end
        k = k + 1;
        fx = (1/2)*x'*G*x + x'*c;
        fprintf(' %d  \t %f\n', k, fx)
    end
    if (k == kmax)
        fprint('[!] Maximo de iteracioes alcanzado($d)\n\n', kmax)
    end
end


