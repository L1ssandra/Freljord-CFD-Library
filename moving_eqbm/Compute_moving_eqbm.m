clear;clc

xa = 0; xb = 2; % The domain

Nx = 40; % The number of cells

hx = (xb - xa)/Nx; % The mesh size

Xc = xa + hx/2:hx:xb - hx/2; % The mesh

M3 = [0; 0.01; 2.5];

rho3 = zeros(Nx,3);
u3 = zeros(Nx,3);
p3 = zeros(Nx,3);

for COUNT = 1:3

    % M = 0;
    % M = 0.01;
    % M = 2.5;

    M = M3(COUNT);

    gamma = 5/3;
    m0 = -M*gamma^0.5;
    H0 = 0.5*M^2*gamma + gamma/(gamma - 1);

    uh = zeros(Nx,3); % The solution

    for i = 1:Nx

        x = Xc(i);

        phi = @(rho) gamma/(gamma - 1)*rho.^(gamma - 1) + 0.5*m0^2*rho.^(-2) - H0 + x;

        if M < 1
            rhoa = M^(2/(gamma + 1));

            rhob = ((gamma - 1)/gamma*(0.5*M^2*gamma - x) + 1)^(1/(gamma - 1));
        end

        if M >= 1
            rhoa = (2/(M^2*gamma)*(gamma/(gamma - 1) - x) + 1)^(-0.5);

            rhob = M^(2/(gamma + 1));
        end

        uh(i,1) = bisect(phi,rhoa,rhob,1e-13);
        uh(i,2) = m0/uh(i,1);
        uh(i,3) = uh(i,1)^gamma;

    end

    rho3(:,COUNT) = uh(:,1);
    u3(:,COUNT) = uh(:,2);
    p3(:,COUNT) = uh(:,3);

end

figure(1); hold on
plot(Xc,rho3(:,1),'ro-')
plot(Xc,rho3(:,2),'b^-')
plot(Xc,rho3(:,3),'ks-')
legend('M = 0','M = 0.01','M = 2.5');
title('rho');
axis([0,2,0,2])

figure(2); hold on
plot(Xc,u3(:,1),'ro-')
plot(Xc,u3(:,2),'b^-')
plot(Xc,u3(:,3),'ks-')
legend('M = 0','M = 0.01','M = 2.5');
title('u')
axis([0,2,-3.5,1])

figure(3);
% plot(Xc,p3(:,1),'ro-')
% plot(Xc,p3(:,2),'b^-')
% plot(Xc,p3(:,3),'ks-')
semilogy(Xc,p3(:,1),'ro-');hold on
semilogy(Xc,p3(:,2),'b^-');
semilogy(Xc,p3(:,3),'ks-')
legend('M = 0','M = 0.01','M = 2.5');
title('p')
axis([0,2,0,10])

