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

%% Problem 6
fprintf('Problem 6\n\n')

% Part A
fprintf('Part A\n')
clear all;
[t,y] = ode45(@problem06,[1.5 6],[ .5 ]);
[t1,y1] = ode45(@problem06,[1.5 0],[ .5 ]);

sol = ode45(@problem06,[1.5 6],[ .5 ]);
sol1 = ode45(@problem06,[1.5 0],[ .5 ]);

hold on;
plot(t,y);
plot(t1, y1)

a = deval(sol1, 0);
b = deval(sol1, 1);
c = deval(sol, 1.8);
d = deval(sol, 2.1);
fprintf(' t \t     y\n')
fprintf('-----------------\n')
fprintf('0\t%.2d\n1\t%.2d\n1.8\t%.2d\n2.1\t%.2d\n',a,b,c,d)

% Part B






%% Problem 8







%% Problem 17