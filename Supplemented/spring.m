function spring
% solves mass spring system 
% with user generated m,k,b and 
% initial values

m = input('mass m = ');
k = input('stiffness k = ');
b = input('friction b = ');
x0 = input('initial position = ');
v0 = input('initial velocity = ');
t0 = input('initial time = ');
t1 = input('final time = ');

% set up 1000 time values on [t0,t1]
t = linspace(t0,t1,1000);
dt = (t1-t0)/1000.0;

% force step size to be 0.01
OPTIONS = odeset('InitialStep',dt,'MaxStep',dt);

% solve system, passing arguments to ode45
[t,y] = ode45(@g,[t0,t1],[x0;v0],OPTIONS,m,k,b);

% plot the solution
plot(t,y(:,1));

% title the plot
title('solution of mass spring system');

% right hand side of ode
function ydot = g(t,y,m,k,b)
ydot = zeros(2,1);
ydot(1) = y(2);
ydot(2) = (-k*y(1)-b*y(2))/m;
