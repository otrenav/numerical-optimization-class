% ConjAct11.m

n = 5;

% Min (1/2)* || x||_2^2
% x. a. sum(x) = 1
%   x >= 0.

Q = eye(n);

A = ones(1,5);
b = 1;
F = eye(n);
d= zeros(5,1);

xc = [1 0 0 0 0]';

% restricciones activas son { 2, 3, 4, 5}

% caso 1: No consideramos reastricciones activas
 c1 = Q*xc; b1 = 0;
 [p,lambda] = PCDirecto(Q,A,c1,b1);
 
 xn = xc + p;
 [p1,lambda1] = PCDirecto(Q, A,Q*xn, b1);
 
 p1
 lambda1

 
 
     
%  % caso 2: Consideramos como activas {2, 5}
%  A1 = [A; [ 0 1 0 0 0]; [0 0 0 0 1]];
%  b1 = [0 0 0]';
%  [p1, lambda1] = PCDirecto(Q, A1,c1,b1)
%  
%  xn1 = xc + p1
%  % otra iteración
%  
%  c2 = Q*xn1; A2 = [A; [ 0 1 0 0 0]]; b2 = [0 0]';
%  
%  [p2, lambda2] = PCDirecto(Q, A2,c2,b2)
%  
%  xn2 = xn1 + p2
%  
 
 
 
 
 
 
 
 




