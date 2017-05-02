%% Final Project by Joseph Martinsen
% Constants
g  = 32.0;
m1 = 2;
m2 = 1;
L1 = 1;
L2 = 2;

u1=1.57;
u1_prime=0;
v1=3.14;
v1_prime=0;

[t,y]= ode45('pend_func' , [ 0 50], [ u1 ; u1_prime ; v1 ; v1_prime ]);

% Potential Energy
PE = -(m1+m2)*g*L1*cos(y(:,1))-m2*g*L2*cos(y(:,3));
% Kinetic Energy
KE = 0.5*m1*L1*L1*y(:,2).^2 + 0.5*m2*(L1*L1*y(:,2).^2+L2*L2*y(:,4).^2+2 * L1*L2*y(:,2).*y(:,4).*cos(y(:,1)-y(:,3)));

% Total Energy
E=PE+KE;
% Plot Total Energy
plot(t ,E);

% l o c a t i o n o f end p o i n t o f d o u bl e pendulum
x = L1* sin( y(:,1)) + L2*sin(y(:,3));
y = -L1* cos(y(: ,1)) - L2*cos(y(:,3));
% p a r a m e t r i c p l o t
plot(x, y);
figure;
plot(t ,y(:,1));
figure;
plot(t ,y(:,3));
figure;
plot(t ,T);
figure;
plot(t ,V);
figure;
plot(t, E);
min(E)
max(E)
( max(E)-min(E))/max( E )
