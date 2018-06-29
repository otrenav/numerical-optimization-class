%
% Programacion Cuadratica Convexa
% Metodo: Region Activa
%
% Omar Trejo Navarro, 119711
% Natalia Orozco Urquijo, 111008
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
%     min 1/2 x'Gx + x'c s.a. ai'x = bi con i en A(x)
%
% In:
% - G: matriz simetrica positiva definida de R^nxn.
% - c: vector en R^n.
% - a: vector en R^n.
% - b: vector en R^n.
% - x: punto inicial en R^n.
% - W: indices de restricciones activas en (R^m).
%      1 -> restriccion activa.
%      0 -> restriccion inactiva.
%
% Out:
% - fx: valor de f(x*) en R.
% - x: x*, vector de solucion optima en R^n.
% - W: conjunto de restricciones activas en x*.
% - k: numero de iteraciones realizadas.
%
function [fx, x, W, k] = conjunto_activo(G, c, A, b)
    k = 1;
    kmax = 500;
    tol = 1e-5;
    lambda = -1;

    % Problema especifico (pg. 475):
    x = [2; 0];
    W = [];
    % [x, W] = fase_uno(G, c, a, b);

    sprintf(' iter \t f(x) ');
    sprintf('-------------------------');
    while (any(lambda < 0) && k <= kmax)
        % Resolver el subprolema (16.39):
        %     p = argmin (1/2)p'Gp + g'p
        %     s.a. ai'p = 0 con i en W
        g = G*x + c;
        Asub = A(W, :);
        bsub = zeros(size(Asub, 1));
        Azero = zeros(size(Asub));
        bzero = bsub;

        % TODO: Con que tecnica resolvemos esto?
        % Metodo de espacio nulo.
        % - MetodoNullSpace1
        % - Sol_Particular (Ax == b)
        p = quadprog(G, g, Azero, bzero, Asub, bsub);

        if (norm(p) <= tol)
            % Resolver la ecuacion (16.42) para lambda:
            %     Asub*lambda = g = Gx + c

            % TODO: Revisar que onda con esto:
            lambda = Asub'\g;

            if (any(lambda < 0))
                % Nota: cuidado con las que restricciones
                % de desigualdad (las que estan en I).
                [~, i] = min(lambda)
                W = W(W ~= i);
            end
        else
            % Calcular alpha para
            % i fuera de W y ai'pk < 0:
            D = (b-A*x)./(A*p);
            idx_1 = find(A*p > 0);

            % TODO: Actualizar esto
            idx_2 = find(W == 0);

            D(idx_1) = inf;
            D(idx_2) = inf;
            alpha = min(1, min(D));
            x = x + alpha*p;
            if (any(A*x == b))
                i = find(A*x == b);
                W = [W; i];
            end
        end
        k = k + 1;
        fx = (1/2)*x'*G*x + x'*c;
        sprintf(' %d  \t %f', k, fx);
    end
    if (k == kmax)
        sprint('[!] Maximo de iteracioes alcanzado($d)', kmax);
    end
end


