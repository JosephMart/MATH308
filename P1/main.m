%% PROJECT 01
% written by Joseph Martinsen
% Math 308-510
clear;clc;

%% Problem 1
clear;clc;
syms y(x)
eqn = diff(y,x) == x*y;
cond = y(0) == 1;
cond1 = y(0) == 2;
cond2 = y(0) == -1;
ySol1 = char(dsolve(eqn,cond));
ySol2 = char(dsolve(eqn,cond1));
ySol3 = char(dsolve(eqn,cond2));

fprintf('Problem 1: dy/dx = xy\n\n')
fprintf('Y solution for y(0) = 1: %s\n',ySol1)
fprintf('Y solution for y(0) = 2: %s\n',ySol2)
fprintf('Y solution for y(0) = -1: %s\n',ySol3)

% Plot for y(0) = 1
[x1, y1] = euler('rhs',0,1,0.1,100);
[x2, y2] = euler('rhs',0,1,0.01,200);

plot(x1,y1,'r')
hold on
plot(x2,y2,'b')
p = ezplot(ySol1);

set(p,'Color','g')
title('y'' = xy with y(0) = 1')
axis([0 2 0.8 2])
legend('h = 0.1','h = 0.01', 'x*y')

% Plot for y(0) = 1
figure
[x3, y3] = euler('rhs',0,2,0.1,100);
[x4, y4] = euler('rhs',0,2,0.01,200);

plot(x3,y3,'r')
hold on
plot(x4,y4,'b')
p = ezplot(ySol2);

set(p,'Color','g')
title('y'' = xy with y(0) = 2')
axis([0 2 1.8 3])
legend('h = 0.1','h = 0.01', 'x*y')


% Plot for y(0) = -1
figure
[x3, y3] = euler('rhs',0,-1,0.1,100);
[x4, y4] = euler('rhs',0,-1,0.01,200);

plot(x3,y3,'r')
hold on
plot(x4,y4,'b')
p = ezplot(ySol3);

set(p,'Color','g')
title('y'' = xy with y(0) = -1')
axis([0 2 -2 -.8])
legend('h = 0.1','h = 0.01', 'x*y')

%% Problem 2
syms y(x)
eqn = diff(y,x) == y^2;
cond = y(0) == 1;
cond1 = y(0) == 2;
cond2 = y(0) == -1;
ySol(x) = dsolve(eqn,cond)
ySol(x) = dsolve(eqn,cond1)
ySol(x) = dsolve(eqn,cond2)

%% Problem 3
syms y(x)
eqn = x*diff(y,x) + sin(x)*y == x^2;
cond = y(0) == 1;
cond1 = y(0) == 2;
cond2 = y(0) == -1;
ySol(x) = dsolve(eqn,cond)
ySol(x) = dsolve(eqn,cond1)
ySol(x) = dsolve(eqn,cond2)
