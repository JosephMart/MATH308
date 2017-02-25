%% Due 3/2/17 (page 75 ff) Problem Set B - 2, 4, 9, 12 (use dfield8), 15

%% Problem 2
clear;
syms y(t)
eqn = t*diff(y,t) + 2*y == exp(t);


figure
hold on
for i= -3:3
    cond = y(1) == i;
    ySol(t) = dsolve(eqn,cond);
    ezplot(ySol(t))
end
axis([-3 3 -10 10])
title('Problem 2')
ylabel('y(t)')

%% Problem 4
clear;
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
%% Problem 9
clear;
syms a(t) b(t) c(t) d(t) e(t) r k y(t)
a = diff(y,t) == r*y - k *y^2;
b = diff(y,t) == t*(t^2+1)/(4*y^3);
c = (exp(t)*sin(y)+3*y)/(3*t-exp(t)*sin(y)) == diff(y,t);
d = diff(y,t) == (2*y-y)/(2*t-y);
e = diff(y,t) == (2*t+y)/(3+3*y^2-t);

eq = [
a
b 
c
d
e
];
dsolve(eq(2))
%% Problem 12


%% Problem 15