%% Due 3/23/17 (page 131 ff) Problem Set C - 5, 6, 8, 17

%% Problem 5
fprintf('Problem 5\n\n')
y0= 0.1:0.1:5; % initialising y(0)
[t,y] = ode45(@problem05,[0 6],[ y0 ]);
hold on;
plot(t,y);

title('Problem 5')
xlabel('t')
ylabel('y')
hold off;

%% Problem 6
fprintf('Problem 6\n\n')

% Part A
fprintf('Part A\n')
clear all;
[pt,py] = ode45(@problem06,[1.5 6],[ .5 ]);
[pt1,py1] = ode45(@problem06,[1.5 0],[ .5 ]);

sol = ode45(@problem06,[1.5 6],[ .5 ]);
sol1 = ode45(@problem06,[1.5 0],[ .5 ]);

figure; hold on; grid on;
plot(pt,py,'b');
plot(pt1, py1, 'b')
title('Problem 6 - Part A')
xlabel('t')
ylabel('y')
hold off;

a = deval(sol1, 0);
b = deval(sol1, 1);
c = deval(sol, 1.8);
d = deval(sol, 2.1);
fprintf('Actual Solutions\n')
fprintf(' t \t     y\n')
fprintf('-----------------\n')
fprintf('0\t%.2d\n1\t%.2d\n1.8\t%.2d\n2.1\t%.2d\n\n',a,b,c,d)


% Part B
syms t y
dsolve('Dy = (t - exp(-t))/(y + exp(y))','y(1.5) = .5' ,'t')
f = 1/exp(t) - exp(y) + t^2/2 - y^2/2;
c = subs(f, [t, y], [1.5, 0.5]);

figure; hold on; grid on;
plot(pt,py,'b');
plot(pt1, py1, 'b')
ezplot(f-c, [-1, 3, -2, 2])
title('Problem 6 - Part B')
xlabel('t')
ylabel('y')
legend('show')
legend('Actual Solution', 'Actual Solution', 'Numerical Solution')

fprintf('Numerical Solutions\n')
fprintf(' t \t     y\n')
fprintf('-----------------\n')
for j = [0, 1, 1.8, 2.1]
    f1 = @(y) eval(subs(f, t, j) - c);
    y1 = fzero(f1, 0.5);
    fprintf('%.1d\t%.2d\n',j, double(y1))
    plot(j, double(y1), 'o')
end
fprintf('\nThe Actual and Numerical solutions are the same when rounded to 3 digits.\n\n')
hold off

% Part C
fprintf('Part C\n\n')
figure; hold on;
ezplot(f-c, [1.5, 100, -2, 10])
title('Problem 6 - Part C')
xlabel('t')
ylabel('y')
fprintf('From looking at the graph, as t approaches inf, y approaches 8')

%% Problem 8







%% Problem 17