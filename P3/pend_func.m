function[ yP ] = pend_func(t, y)

    g =32.0;
    m1 = 2;
    m2 = 1;
    L1 = 1;
    L2 = 2;
    yP = zeros(4 ,1);

    a = (m1 + m2)*L1;
    b = m2*L2*cos(y(1) - y(3));
    c = m2*L1*cos(y(1) - y(3));
    d = m2*L2;
    e = -m2*L2*y(4).^2 * sin(y(1) - y(3))-g*(m1+m2)*sin(y(1));
    f = m2*L1 *y(2).^2 *sin(y(1) - y(3)) - m2*g *sin(y(3));


    % Differential Equations
    yP(1) = y(2); % du1/dt = u2
    yP(2) = ( e*d-b*f ) / ( a*d-c*b ); % du2/dt
    yP(3) = y(4); % dv1/dt = v2
    yP(4) = (a*f-c*e) / (a*d-c*b ); % dv2/dt

end
