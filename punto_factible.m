function [ x ] = PuntoFactible( A, F, b,d )
% Punto factible del: A*x = b,  F*x >= d
%  

[m,n] = size(A);
p = length(d);

% Problema de pro. lineal
%  Min o'*xm + 0'*xme + e'*w
% s. a.  A*xm - A*xme + 0* w = b
%        F*xm - F*xme - eye(p) * w = d
% xm , xm, xme , w >= 0

cc = [ zeros(n,1); zeros(n,1); ones(p,1)];
AA =[ A -A zeros(m,p); F -F -eye(p)];
bb = [b;d];

lb =[ zeros(2*n,1); zeros(p,1)];
ub = inf*[ones(2*n,1); ones(p,1)];

[z] = linprog(cc,[],[],AA,bb,lb,ub);
xm = z(1:n);
xme = z(n+1:2*n);
w = z(2*n+1: 2*n +p);

ff = sum(w);

x = xm - xme;









end

