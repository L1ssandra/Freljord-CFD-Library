function u = calculate_burgers(x,t,a,b)

% This program computates the exact solution of Burgers' equation:
% u_t + u*u_x = 0, u(x,0) = a + b*sin(x),  ...(1)
% where a = 1, b = 2, t = 1.
% We can first solve u1_t + u1*u1_x = 0, u1(x,0) = sin(x),  ...(2)
% and let u(x,t) = a + b*u1(x - at,bt).

epsilon = 1e-14;

u0 = @(x) sin(x);

% solve (2) with x = x - at, t = bt, then we can get u1(x - at,bt)
x = x - a*t;
t2 = b*t;
% for each (x,t), we need to solve the equation of z:
% F(z) := z + u0(z)*t - x = 0

%% Bisect
% if 2k*pi < x < (2k + 1)*pi, then
% F(2k*pi) = 0 + sin(0)*t - x < 0; F((2k + 1)*pi) = pi + sin(pi) - x > 0
% else, likewise, we have F(pi) < 0, F(2*pi) > 0.
F = @(z) z + u0(z)*t2 - x;
delta = mod(x,2*pi);
if mod(x,2*pi) < pi
    za = x - delta;
    zb = za + pi;
else
    za = x - delta + pi;
    zb = za + pi;
end
xstar = bisect(F,za,zb,epsilon);
u= u0(xstar);


% change to the solution of (1)
u = a + b*u;

end