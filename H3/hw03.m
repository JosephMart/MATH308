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
clear;
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
figure; hold on; grid on;
ezplot(f-c, [1.5, 10000, -2, 100])
title('Problem 6 - Part C')
xlabel('t')
ylabel('y')
fprintf('From looking at the graph, as t approaches inf, y approaches infinity\n\n')

%% Problem 8
fprintf('Problem 8\n\n')
clear;
% Part A
fprintf('Part A\n\n Using dsolve, the solution is below')
dsolve('Dy = exp(-t^2)', 't')

% Part B
syms t x
diff(erf(t),x)
help erf

% Part C
c = [ 0 1 10.5];
erf(c)

ezplot(erf(x), [-10 10])

% Part D
limit(erf(t),t,inf)
int(exp(-t^2),-inf,inf)

% Part E
dsolve('Dy = 1 - 2*t*y','y(0)=0','t')

%% Problem 17
clear;
format long
options = odeset('AbsTol', 1e-10, 'RelTol', 1e-10);
sol = ode45(@problem17,[0 6],[ 0 ], options);

t = 0.1:0.1:1;
Ode45Solutions = deval(sol, t);
erfFunc = erf(t);
t = t';

digits(10)
Ode45Solutions = double(vpa(Ode45Solutions))';
erfFunc = double(vpa(erfFunc))';

T = table(t, Ode45Solutions ,erfFunc)






