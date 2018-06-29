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
% - x: x*, vector de solucion optima en R^n.
% - beta: betas asociadas a la solucion optima.
% - k: numero de iteraciones realizadas.
%
function [x, beta, k] = ConjuntoActivo(Q, A, F, c, b, d)
    tol    = 1e-5;
    [n, ~] = size(F);
    [n2,~] = size(A);
    exitflag = 0;
    I = zeros(n, 1);  % Indices de restricciones activas
    k = 0;
    kmax = 500;

    % Solucion inicial
    options = optimset('Display', 'none');
    x = linprog(c, -F, -d, A, b, [], [], [], options);
    m = length(x);

    fprintf('\n iter \t f(x)\n')
    fprintf('----------------------\n')

    while (exitflag == 0 && k <= kmax)
        g = Q*x + c;
        Fsub = [A; F((I == 1),:)];
        K = [Q, Fsub'; Fsub, zeros(sum(I) + n2)];
        ld = [-g; zeros(sum(I) + n2, 1)];
        r = linsolve(K, ld);
        p = r(1:m);
        eta = r((m + n2 + 1):end);
        if (norm(p) <= tol)
            if (sum(I) == 0)
                exitflag = 1;
            else
                if (eta <= 0)
                    exitflag = 1;
                else
                    if (~isempty(eta))
                        ra = find(I);  % Restricciones activas
                        eta_max = find(eta == max(eta));
                        I(ra(eta_max(1))) = 0;
                    end
                end
            end
        else
            Fp = F*p;
            w = (Fp < 0).*(1-I);
            if (sum(w) > 0)
                aux = [find(w), nan(sum(w),1)];
                for i = 1:sum(w)
                    aux(i, 2)= max((d(aux(i, 1)) - F(aux(i, 1), :)*x)/Fp(aux(i,1)), 1e-8);
                end
                alpha = min(min(aux(:, 2)), 1);
                if alpha < 1
                    [~, i] = min(aux(:, 2));
                    I(aux(i, 1)) = 1;
                end
            else
                alpha = 1;
            end
            x = x + alpha*p;
        end
        k = k + 1;
        fx = (1/2)*x'*Q*x + x'*c;
        fprintf(' %d  \t %f\n', k, fx)
    end
    col  = length(x)-1;
    beta = x(col + 1: end);
    x    = x(1:col);
    if (k == kmax)
        fprint('[!] Maximo de iteracioes alcanzado($d)\n\n', kmax)
    end
end

