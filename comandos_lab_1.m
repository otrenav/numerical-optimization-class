%
% Comandos del laboratorio
%
[Q, A, c, b] = Generapc(450, 300, 0.7);
spy(Q);
spy(A);
K = [Q A'; A zeros(300)];
spy(K);
[L, U, P] = lu(K);
spy(L);
spy(U);

norm(P*L*U - K)  % Prueba de que son iguales

%%%

[x, lambda] = pcdirecto(Q, A, c, b);


%%% Segund parte de la clase
spy(Q);
whos

tic; [x1, lambda] = pcrango(Q, A, c, b); toc;
norm(x-x1)
norm(lambda-lambda1)

