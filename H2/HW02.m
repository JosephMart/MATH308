%% Due 3/2/17 (page 75 ff) Problem Set B - 2, 4, 9, 12 (use dfield8), 15

%% Problem 2
fprintf('Problem 2\n')

clear;
syms y(t)
eqn = t*diff(y,t) + 2*y == exp(t);

% Part A
ySol(t) = dsolve(eqn,y(1) == 1);
yp = (exp(t)*(t-1)+1)/t^2;
yprime = diff((exp(t)*(t-1)+1)/t^2,t);
a = t*yprime +2*y;
an = simplify(a);
fprintf('Part A\n\n')
fprintf('y = %s\ny'' = %s\n',char(yp),char(yprime))
fprintf('Subs into the %s results in %s\n',char(ySol(t)),char(a))
fprintf('Using MATLAB''s simplify command results in %s which is exactly what is should be\n\n',char(an))

% Part B
fprintf('Part B\n\n')
figure
ezplot(yp)
axis([-1 3 0 6])
title('Problem 2 - Part B')
ylabel('y(t)')
fprintf('The solution graph for t=0, y(t) approaches 0. The solution graph for large t''s, y(t) approaches Inf\n\n')


% Part C
clear ySol(t)
figure
hold on
for i= -3:3
    cond = y(1) == i;
    ySol(t) = dsolve(eqn,cond);
    ezplot(ySol(t))
end
axis([-3 3 -10 10])
title('Problem 2 - Part C')
ylabel('y(t)')

% Part D
fprintf('Part D\n\n')
fprintf('As the graphs approach t=0, the graphs diverge. For larg t''s, the graphs begin to approach Inf\n')
fprintf('Yes there is a singularity, for the condition y(t) = 1, the graph does not diverge at t=0\n')

%% Problem 4
clear;
fprintf('Problem 4\n\n')
syms y(t)
eqn = diff(y,t) - 2*y == sin(2*t);
figure
hold on

for i = -0.5:.05:0
    cond = y(1) == i;
    ySol(t) = dsolve(eqn,cond);
    ezplot(ySol(t))
end
axis([0 4 -5 5])
title('Problem 4')
ylabel('y')

fprintf('As t increases, the slope increaces. ')
fprintf('The 3 different behaviors are, slope is always negative (c = -.5,-.45,-.4,-.35), the slope begins positive then becomes negative. (c = -.3,-.25,-.2,-.15) ')
fprintf('and the third is the slope is always positive (c = -.1, -.05, 0)\n\n')
%% Problem 9
clear;
fprintf('Problem 9\n\n')
syms r k y(t) a(t)

% Part A
fprintf('Part A\n')
a = diff(y,t) == r*y - k * y^2;
aANS(t) = dsolve(a);
fprintf('The solutions for %s are:\n', char(a))
display(aANS(t))

% Part B
fprintf('\nPart B\n')
b = diff(y,t) == t*(t^2+1)/(4*y^3);
bANS = dsolve(b, y(0) == -1/sqrt(2));
fprintf('The solution to %s with y(0) = -1/sqrt(2) is\n %s\n\n',char(b), char(bANS))

% Part C
c = (exp(t)*sin(y)+3*y)/(3*t-exp(t)*sin(y)) == diff(y,t);
% dsolve(c)

% Part D
d = diff(y,t) == (2*y-y)/(2*t-y);
dsolve(d)

% Part E
fprintf('Part E\n')
e = diff(y,t) == (2*t+y)/(3+3*y^2-t);
eANS = dsolve(e,y(0)==0);
fprintf('The solution for %s is:\n %s\n\n',char(e),char(eANS))

%% Problem 12
clear;
syms y(t)
fzero(3*sin(y) + y - 2,2)


% Part B - It is obvious that a solution is y = t because lines approach
% that line
%% Problem 15