% Problem Set A - 1, 2, 3, 9, 11
clear;clc;
% 1
% a)
A1 = 413/(768+295);
fprintf('%.2f\n\n',A1)

% b)
fprintf('%.2e\n',2^(123))
fprintf('%.0f\n\n',2^(123))

% c)
fprintf('%1.34f\n',pi^2)
fprintf('%1.34f\n\n',exp(1))

% d)
val = [61/88 13863/20000 253/365];
ln2 = log(2);
small = val(1);
temp = ln2 + val(1);

for i = 1:3
    fprintf('%f\n',val(i))
    if abs(val(i) - ln2) < temp
        small = val(i);
    end
end
fprintf('Best approx = %f\n\n',small)



% 2
a = 1;
prob = ['a', 'b', 'c'];

for i = 1:3
    val = sin(a/(10^i))/(a/10^i);
    fprintf('%s) %.15f\n',prob(i),val)
end


% 3
% a
fplot(@(x) x.^3-x,[-1.5 1.5])
title('3 A')
figure

% b
fplot(@(x) tan(x),[-2*pi 2*pi])
title('3 B')
figure

% c
fplot(@(x) x.^3-x,[-2.5 2.5])
title('3 C')

% 9
figure
fplot(@(x) x.^5 - 3*x.^2 + x + 1,[-2 2])
syms x
solve(x^5 - 3*x^2 + x + 1 == 0,x)
title('Problem 9')
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';

% 11
syms x y
e1 = x^2 - y^2 == 1;
e2 = 2*x+y == 2;
sol = solve([e1, e2], [x,y]);
fprintf('(%.2f, %.2f) and (%.2f, %.2f)\n',sol.x(1),sol.y(1),sol.x(2),sol.y(2))

figure
axis([-5 5 -5 5])
hold on
fplot(@(x) sqrt(x.^2-1),'b')
fplot(@(x) -sqrt(x.^2-1),'b')
fplot(@(x) -2*x +2,'r')
title('Problem 11')
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';




