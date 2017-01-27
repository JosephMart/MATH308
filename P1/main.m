% PROJECT 01
% written by Joseph Martinsen
clear;clc;

% Problem 1 
[x,y] = meshgrid(-10:1:10,-10:1:10);
u = x.*y;
v = x.*y;

figure
hold on

b = quiver(x,y,u,v)
b.axis([0,10,-10,10])