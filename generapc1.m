function [G,A,F,c,b,d] = Generapc1(n,m,p,tau)
% Genera problemas cuadr�ticos 'aleatorios' de la forma
%   Min  (1/2)*x'*G*x + c'*x
%   s. a.   A*x = b;
%           F*x >= d

% In
% n.- n�mero natural.
% m.- n�mero natural tal que m < n
% tau.- n�mero real positivo menor a 1.
%
% Out
% G.- matriz sim�trica 'aleatoria' de orden n.
%     Se tiene que | G(k,j) | > tau.
% A.- matriz 'aleatoria' de mxn.
%     Se tiene que | A(k,j) | > tau.
% b.-  vector columna de longitud m con puros unos.
% c.- vector columna 'aleatorio' de  longitud.

% generando matrices y vectores
G = triu(rand(n),m); 
A = rand(m,n);
F = rand(p,n);
c = rand(n,1);
b = ones(m,1);
d = 100*rand(p,1);

% matriz G
for k =1:n
    for j =k:n
        if(abs(G(k,j))<= tau)
            G(k,j) = 0.0;
        end
    end
end
G = (G'*G) + eye(n);





% matriz A
for k =1:m
    for j =1:n
        if(abs(A(k,j))<= tau)
            A(k,j) = 0.0;
        end
    end
end

% matriz F
for k =1:p
    for j =1:n
        if(abs(F(k,j))<= tau)
            F(k,j) = 0.0;
        end
    end
end
            

            