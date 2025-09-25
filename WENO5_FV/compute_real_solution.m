%exact.m

X = zeros(1,NumGLP*Nx);
for i = 1:Nx
    X(1,(i - 1)*NumGLP + 1:i*NumGLP) = Xc(i) + hx1*lambda; 
end

u = zeros(1,NumGLP*Nx);
epsilon = 1e-14;

u0 = @(x) sin(x);
du0 = @(x) cos(x);

X1 = X - 0.5*t;

for i = 1:NumGLP*Nx
    x = X1(i);
    F = @(z) z + u0(z)*t - x;
    dF = @(z) 1 + du0(z)*t;
    G = @(z) z - F(z)/dF(z);
    delta = mod(x,2*pi);
    if mod(x,2*pi) < pi
        x0 = x - delta;
    else
        x0 = x - delta + 2*pi;
    end
    xstar = fpi(G,x0,epsilon,100);
    u(i) = u0(xstar);
end

u = 0.5 + u;

hold on
plot(X,u,'k-','linewidth',1.3)


