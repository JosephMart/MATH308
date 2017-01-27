function yprime = rhs(x, y)

% rhs returns a function which is the right hand side
% of a first order differential equation
% dy/dx = y' = f(x,y)

yprime = y*y;
