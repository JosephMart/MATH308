%% Due 4/6/17 (page 157 ff) Problem Set D - 3, 7, 11, 16

%% Problem 3
clear;

% Part A
% y'' + sin(y) = 0
rhs = @(t,y) [y(2); - sin(y(1))];
figure; hold on;
% Amplitude values
A = [.1 .7 1.5 3];
% Colors for the Graph
C = ['c' 'r' 'g' 'b' 'w'];
fprintf('Problem 3\n\nPart A\n\n')
for i = 1:4
    [xa, ya ]= ode45(rhs,[0 8], [A(i) ; 0]);
    p(i) = findPeriod(xa, ya(:,1),0);
    plot(xa,ya(:,1),C(i))
    [xa, ya ]= ode45(rhs,[0 -8], [A(i) ; 0]);
    plot(xa,ya(:,1),C(i))
    fprintf('Estimated Period for A = %.2f is %.5f\n\n', A(i), p(i))
end
axis([-8 8 -4 4])
title('Problem 3 - Part A')
grid minor

% Part B
fprintf('\nPart B\n\n')
for i = 1:4
    F = @(x) 1./sqrt(1 - sin(A(i)./2).^2 * sin(x).^2);
    Q = 4 * quad(F,0,pi/2);
    fprintf('Using elliptic integral for A = %.2f I get %.5f\n', A(i), Q)
    fprintf('This value is %.4f different from the value in A\n\n', abs(p(i) - Q))
end

% partc C
fprintf('Part C\n\n')
figure; hold on;
% Amplitude values
A = [.6 .8 .9 1];
% Colors for the Graph

for i = 1:4
    [xa, ya ]= ode45(rhs,[0 8], [A(i) ; 0]);
    p(i) = findPeriod(xa, ya(:,1),0);
    plot(xa,ya(:,1),C(i))
    [xa, ya ]= ode45(rhs,[0 -8], [A(i) ; 0]);
    plot(xa,ya(:,1),C(i))
    fprintf('Estimated Period for A = %.2f is %.5f\n\n', A(i), p(i))
end
axis([-8 8 -4 4])
title('Problem 3 - Part C')
grid minor

for i = 1:4
    F = @(x) 1./sqrt(1 - sin(A(i)./2).^2 * sin(x).^2);
    Q = 4 * quad(F,0,pi/2);
    fprintf('Using elliptic integral for A = %.2f I get %.5f\n', A(i), Q)
    fprintf('This value is %.4f different from the value in C before\n\n', abs(p(i) - Q))
end

% Part D
fprintf('Part D\n\n')
fprintf('The change in the period is not much for values of A < 2. Once A>2 the period shoots up\n')

%% Problem 7
% clear;
% G = 32;
% M = 195/G;
% % rhs = @(t,y) [y(2); -sqrt((1 + y(1)) * (32) / (0.005/M + 0.5))];
% rhs = @(t,y) [y(2); -sqrt((M*G*y(1) - M*G) / (.5*M + 0.005) )];
% [xa, ya ]= ode45( );
% a = ode45(rhs,[0 5], [1000 ; 0]);
% deval(a,0)

%% Problem 11
clear;
fprintf('Problem 11\n\n')
syms y(t)
k = 1;
m = k;
lam = 0;
i = [0 .1 .2 .3];
j = 1;

for ep = i
    [V] = odeToVectorField(m * diff(y, 2) + lam * diff(y,1) + k * y + ep * y ^ 3 == 0);
    M = matlabFunction(V,'vars', {'t','Y'});
    sol = ode45(M,[0 20], [0;1]);
    [xa, ya] = ode45(M,[0 20], [0;1]);
    p(j) = findPeriod(xa, ya(:,1),11);
    a(j) = findAmplitude(ya);
    fprintf('For epsilon = %.1f the estimated Amplitude is %.3f and Period is %.3f\n\n', ep, a(j), p(j))
    j = j + 1;
    figure
    fplot(@(x)deval(sol,x,1), [0, 20])
    title(['Problem 11 epsilon = ' num2str(ep)]);
end

figure; hold on;
plot(p,i)
plot(a,i)
title('Period and Amplitude vs epsilon')
hold off

% repeat for negative values
fprintf('Now for negative Values of epsilon\n\n')
i = [0 -.1 -.2 -.3];
j = 1;
% for epsilon = 0

for ep = i
    [V] = odeToVectorField(m * diff(y, 2) + lam * diff(y,1) + k * y + ep * y ^ 3 == 0);
    M = matlabFunction(V,'vars', {'t','Y'});
    sol = ode45(M,[0 20], [0;1]);
    [xa, ya] = ode45(M,[0 20], [0;1]);
    p2(j) = findPeriod(xa, ya(:,1),11);
    a2(j) = findAmplitude(ya);
    fprintf('For epsilon = %.1f the estimated Amplitude is %.3f and Period is %.3f\n\n', ep, a2(j), p2(j))
    j = j + 1;
    figure
    fplot(@(x)deval(sol,x,1), [0, 20])
    title(['Problem 11 epsilon = ' num2str(ep)]);
end

figure; hold on;
plot(p2,i)
plot(a2,i)
title('Period and Amplitude vs -epsilon')

%% Problem 16
fprintf('Problem 16\n\n')
fprintf('Part A')
% Part A
syms y(x)
syms x
firstOrder = @(x, z) cos(z).^2 - ( x .* sin(z).^2);
[X, Z] = meshgrid(-10:.5:5, -pi/2:.2:pi/2);
W = firstOrder(X,Z);
l = sqrt(1 + W.^2);
quiver(X, Z, 1./l, W./l, .5)
axis tight
title('Problem 16 - Part A')
fprintf('To the left x-axis, the field looks the same. To the right, a \n')
fprintf('siniosodal nature occurs. The zeros of the solution occur \n')
fprintf('towards x-> -inf and happen in 0.5 increments. It appears one or less intersections would occur.\n')
fprintf(' The solutions oscillitate towards negative infinity but not infinity.') 

% Part B
figure; hold on;
for x = -10:5
    [V] = odeToVectorField(diff(y, 2) == y*airy(0,x));
    M = matlabFunction(V,'vars', {'x','Y'});
    for i = -1:1
        for j = -1:1
            sol = ode45(M,[-10 5], [i;j]);
            fplot(@(x)deval(sol,x,1), [-10, 5])
        end
    end
end
axis([-10 5 -80 80])
title(['Part B'])

fprintf('The plots do not appear to be exactly the same')
