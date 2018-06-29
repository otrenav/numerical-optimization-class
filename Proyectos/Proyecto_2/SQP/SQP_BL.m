%
% Algoritmo SQP con búsqueda de línea
%
% Prof. Zeferino Parada
% Optimización Númerica
%
% Omar Trejo Navarro, 119711
% Juan Pedro Luengas Garcia, 119493
% Natalia Orozco Urquijo, 111008
%
% ITAM, 2015
%
% Implementamos el algoritmo de la pg. 545 de Nocedal.
%
% Input:
% - fname: nombre de la función objetivo
% - cname: nombre la la función de restricciones
% - x:     valor inicial del vector de variables
%
% Output:
% - x: argmin de la función objetivo
% - f: valor de la función objetivo
% - i: número de iteraciones utilizadas
%
function [x, f, i] = SQP_BL(fname, cname, x)
    tol = 1e-3;                 % Tolerancia
    e   = 0.1;                  % Eta
    t   = 0.5;                  % Tau
    c   = feval(cname, x);      % Restricciones
    f   = feval(fname, x);      % Función objetivo
    l   = ones(length(c), 1);   % Lambda
    df  = gradiente(fname, x);  % Gradiente de f
    A   = jacobiana(cname, x);  % Gradiente de c
    B   = eye(length(x));       % Hessiana
    i   = 0;                    % Iteraciones
    im  = 500;                  % Iteraciones máximas

    while norm(c) >= tol && i < im
        %
        % Problema cuadrático
        %
        dLa    = (df + A'*l);
        [p, l] = QP(B, A, df, -c);

        %
        % Búsqueda de linea
        %
        a      = 1;
        m      = (df'*p + (1/2)*p'*B*p)/(0.5*norm(c, 1));
        xn     = x + a*p;
        fxn    = feval(fname, xn);
        cxn    = feval(cname, xn);
        phi_x  = f + c'*l + m/2*c'*c;
        phi_xn = fxn + cxn'*l + m/2*(cxn'*cxn);
        ddir   = (df + A'*l)'*p - m*c'*c;
        ibl    = 0;
        iblm   = 15;

        while phi_xn > phi_x + e*a*ddir && ibl < iblm
            a      = t*a;
            xn     = x + a*p;
            fxn    = feval(fname, xn);
            cxn    = feval(cname, xn);
            Axn    = jacobiana(cname, xn);
            phi_xn = fxn + cxn'*l + m/2*cxn'*cxn;
            ibl    = ibl + 1;
        end
        if ibl == iblm
            a = 1;
        end
        
        %
        % Actualización
        %
        x   = x + a*p;
        c   = feval(cname, x);
        df  = gradiente(fname, x);
        A   = jacobiana(cname, x);
        l   = -(A*A')\(A*df); % MCL
        
        %
        % Damped BFGS
        %
        s   = a*p;
        dL  = df + A'*l;
        y   = dL - dLa;
        if s'*y >= 0.2*s'*B*s;
            ag = 1;
        else
            ag = 0.8*s'*B*s/(s'*B*s - s'*y);
        end
        r = ag*y + (1 - ag)*B*s;
        B  = B - B*s*s'*B/(s'*B*s) + r*r'/(s'*r);

        i = i + 1;
        normas(i) = norm(c);
    end

    %
    % Gráfica de convergencia
    %
    figure(1);
    plot(1:i, normas, '--b', 'LineWidth', 3)
    xlabel('Iteraciones');
    ylabel('Norma de las restricciones');
    title('Convergencia');
    f = feval(fname, x);
end