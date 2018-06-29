%
% Fase I: encontrar un punto incial factible y
% un conjunto de indices de restricciones activas
% en ese punto incial del problema.
%
% Programacion Cuadratica Convexa
% Metodo: Region Activa
%
% Natalia Orozco Urquijo, 111008
% Omar Trejo Navarro, 119711
% Juan Pedro Luengas Garcia, 119493
%
% Marzo, 2015
%
% Dr. Zeferino Parado
% Optimizacion Numerica
% ITAM
%
% In:
% - A: matriz en R^mxn de rango m con m <= n.
% - b: vector en R^n.
%
% Out:
% - x: punto inicial en R^n.
% - W: conjunto activo inicial.
%
function [x, W] = FaseUno(A, b)
    x = solucion_particular(A, b);
    W = restricciones_activas(A, b, x);
end