function  [gfx] = gradiente(fname,x)
% Juan P Aguilera 136078
% Luis M Rom�n    117077
% Madeleine Le�n  125154
%------------------------------------------
% Aproximacion del gradiente por diferencias hacia adelante 
% de una funcion  de R^n a R.
% Zeferino Parada
% 3 septiembre de 2002
%In
% fname .- cadena con el nombre de la funcion.
% x .- vector columna de dimension n.
% Out
% gfx - vector columna de dimension n, es la aproximacion al
%       gradiente en x.
h   = 1.e-08;
fx  = feval(fname,x);
n   = length(x);
gfx = zeros(n,1);
%------------------------------------------
for k = 1:n
    xt     = x; 
    xt(k)  = xt(k) + h;
    fxh    = feval(fname, xt);
    gfx(k) = (fxh - fx) / h;
end




