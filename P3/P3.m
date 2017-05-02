%% Final Project by Joseph Martinsen
% Math 308-510 - Dr. Pilant

%% Case 1
clear;
close all;
clc;

% Constents
g  = 32;
m1 = 2;
m2 = 1;
L1 = 1;
L2 = 2;

fprintf('For case 1, the following inital values are used\nm1 = 2\n')
fprintf('m2 = 1\nL1 = 1\nL2 = 2\nu1 = 1.57\nu1prime = 0\nv1 = 3.14\nv1prime = 0')

u1       = 1.57;
u1_prime = 0;
v1       = 3.14;
v1_prime = 0;

% Solve Differential Equation
options = odeset('AbsTol',1e-6,'RelTol',1e-6);
[t,y]= ode45('pend_func' , [ 0 100], [ u1 ; u1_prime ; v1 ; v1_prime ],options);

% Potential Energy
PE = -(m1+m2)*g*L1*cos(y(:,1))-m2*g*L2*cos(y(:,3));
% Kinetic Energy
KE = 1/2*m1*L1.^2*y(:,2).^2 + 0.5*m2*(L1.^2*y(:,2).^2+L2.^2*y(:,4).^2 + 2* L1*L2*y(:,2).*y(:,4).*cos(y(:,1)-y(:,3)));

% Total Energy
E=PE+KE;

% Position Values
x = L1* sin( y(:,1)) + L2*sin(y(:,3));
yplot = -L1* cos(y(: ,1)) - L2*cos(y(:,3));

% Plot
plot(x, yplot);
 axis([-3 3 -3 2])
title('Double Pendulum')
figure;
plot(t,y(:,1));
%axis([0 100 -10 30])
title('Theta 1 vs Time')
figure;
plot(t,y(:,3));
%axis([0 100 -50 40])
title('Theta 2 vs Time')
figure;
plot(t,PE);
title('Potential Energy')
figure;
plot(t,KE);
title('Kinetic Energy')
figure;
plot(t,E);
title('Total Energy')
figure;
plot(t,E);
title('Total Energy')
axis([0 100 0 100])

fprintf('Total energy deviation %f %% \n', 100*(max(E)-min(E))/(max(E)))

%% Case 2
clear;
clc;

% Constents
g  = 32;
m1 = 2;
m2 = 1;
L1 = 1;
L2 = 2;

fprintf('For case 2, the angles will differ from Case 1.\n')
fprintf('The following inital values are used\nm1 = 2\n')
fprintf('m2 = 1\nL1 = 1\nL2 = 2\nu1 = 2\nu1prime = 0\nv1 = 1\nv1prime = 0')

u1       = 2;
u1_prime = 0;
v1       = 1;
v1_prime = 0;

% Solve Differential Equation
options = odeset('AbsTol',1e-6,'RelTol',1e-6);
[t,y]= ode45('pend_func' , [ 0 100], [ u1 ; u1_prime ; v1 ; v1_prime ],options);

% Potential Energy
PE = -(m1+m2)*g*L1*cos(y(:,1))-m2*g*L2*cos(y(:,3));
% Kinetic Energy
KE = 1/2*m1*L1.^2*y(:,2).^2 + 0.5*m2*(L1.^2*y(:,2).^2+L2.^2*y(:,4).^2 + 2* L1*L2*y(:,2).*y(:,4).*cos(y(:,1)-y(:,3)));

% Total Energy
E=PE+KE;

% Position Values
x = L1* sin( y(:,1)) + L2*sin(y(:,3));
yplot = -L1* cos(y(: ,1)) - L2*cos(y(:,3));

% Plot
plot(x, yplot);
 %axis([-3 3 -3 2])
title('Double Pendulum')
figure;
plot(t,y(:,1));
%axis([0 100 -10 30])
title('Theta 1 vs Time')
figure;
plot(t,y(:,3));
%axis([0 100 -50 40])
title('Theta 2 vs Time')
figure;
plot(t,PE);
title('Potential Energy')
figure;
plot(t,KE);
title('Kinetic Energy')
figure;
plot(t,E);
title('Total Energy')
figure;
plot(t,E);
title('Total Energy')
axis([0 100 0 100])

fprintf('Total energy deviation %f %% \n', 100*(max(E)-min(E))/(max(E)))

%% Case 3
clear;
clc;

% Constents
g  = 32;
m1 = 2;
m2 = 2;
L1 = 2;
L2 = 2;

fprintf('For case 3, the mass and length will differ from Case 1.\n')
fprintf('The following inital values are used\nm1 = 5\n')
fprintf('m2 = 1\nL1 = 1\nL2 = 5\nu1 = 1.57\nu1prime = 0\nv1 = 3.14\nv1prime = 0')

u1       = 1.57;
u1_prime = 0;
v1       = 3.14;
v1_prime = 0;

% Solve Differential Equation
options = odeset('AbsTol',1e-6,'RelTol',1e-6);
[t,y]= ode45('pend_func' , [ 0 100], [ u1 ; u1_prime ; v1 ; v1_prime ],options);

% Potential Energy
PE = -(m1+m2)*g*L1*cos(y(:,1))-m2*g*L2*cos(y(:,3));
% Kinetic Energy
KE = 1/2*m1*L1.^2*y(:,2).^2 + 0.5*m2*(L1.^2*y(:,2).^2+L2.^2*y(:,4).^2 + 2* L1*L2*y(:,2).*y(:,4).*cos(y(:,1)-y(:,3)));

% Total Energy
E=PE+KE;

% Position Values
x = L1* sin( y(:,1)) + L2*sin(y(:,3));
yplot = -L1* cos(y(: ,1)) - L2*cos(y(:,3));

% Plot
plot(x, yplot);
 %axis([-3 3 -3 2])
title('Double Pendulum')
figure;
plot(t,y(:,1));
%axis([0 100 -10 30])
title('Theta 1 vs Time')
figure;
plot(t,y(:,3));
%axis([0 100 -50 40])
title('Theta 2 vs Time')
figure;
plot(t,PE);
title('Potential Energy')
figure;
plot(t,KE);
title('Kinetic Energy')
figure;
plot(t,E);
title('Total Energy')
figure;
plot(t,E);
title('Total Energy')
axis([0 100 0 100])

fprintf('Total energy deviation %f %% \n', 100*(max(E)-min(E))/(max(E)))
