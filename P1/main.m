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

%% Error Analysis fixing y(0) = 2
[x5, y5] = euler('rhs',0,2,0.1,10);
[x6, y6] = euler('rhs',0,2,0.05,20);
[x7, y7] = euler('rhs',0,2,0.01,100);
[x8, y8] = euler('rhs',0,2,0.005,200);
[x9, y9] = euler('rhs',0,2,0.001,1000);

eq5 = 2 .* exp(x5.^2/2);
eq6 = 2 .* exp(x6.^2/2);
eq7 = 2 .* exp(x7.^2/2);
eq8 = 2 .* exp(x8.^2/2);
eq9 = 2 .* exp(x9.^2/2);

maxdiff(1) = max(abs(y5-eq5));
maxdiff(2) = max(abs(y6-eq6));
maxdiff(3) = max(abs(y7-eq7));
maxdiff(4) = max(abs(y8-eq8));
maxdiff(5) = max(abs(y9-eq9));

fprintf('\nStep \t Difference\n')
fprintf('.1 \t %d\n', maxdiff(1))
fprintf('.05 \t %d\n',maxdiff(2))
fprintf('.01 \t %d\n',maxdiff(3))
fprintf('.005 \t %d\n',maxdiff(4))
fprintf('.001 \t %d\n',maxdiff(5))

step = [.1 .05 .01 .005 .001];

plot(step,maxdiff)
title('Error Analysis of y = 2e^{x^2/2}')
xlabel('h steps')
ylabel('Max Difference')


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