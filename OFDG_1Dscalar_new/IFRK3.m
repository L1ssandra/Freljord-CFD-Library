% RK3.m
t = 0;
T = 0;

frameMAX = 200;
uhflash = zeros(1,Nx*NumGLP);

uhG = zeros(Nx,NumGLP);
for i = 1:Nx
    for d = 1:dimPk
        uhG(i,:) = uhG(i,:) + uh(i,d)*phiG(:,d)';
    end
end
uhG = reshape(uhG',Nx*NumGLP,1)';

uhflash(1,:) = uhG;
t1 = tend/frameMAX;
ii1 = 1;

while t < tend
    
    alpha = max(abs(uh(:,1)));
    
    dt = CFL*hx/alpha;
    
    if t + dt >= tend
        dt = tend - t;
        t = tend;
    else
        t = t + dt;
    end
    % C_local = [0,4,12]/hx^2;%[0,0,0];%
    
    % Stage I
    [du,sigma] = Lh(uh);
    Cmat = zeros(Nx,dimPk);
    for i = 1:Nx
        for d = 1:dimPk
            Cmat(i,d) = -sigma(i,d);
        end
    end
    eCmat1 = exp(Cmat*dt/3); eCmat2 = exp(Cmat*2*dt/3); eCmat = exp(Cmat*dt);
    uh1 = 0.5*eCmat2.*(2*uh + 4/3*dt*du); 
    du0 = du;
    
    % Stage II
    [du,~] = Lh(uh1);
    uh2 = 2/3*eCmat2.*uh + 1/3*(uh1 + 4/3*dt*du);
    
    % Stage III
    [du,~] = Lh(uh2);
    uh = 59/128*eCmat.*uh + 15/128*eCmat.*(uh + 4/3*dt*du0) + 27/64*eCmat1.*(uh2 + 4/3*dt*du);
    
    if t >= ii1*t1
        uhG = zeros(Nx,NumGLP);
        for i = 1:Nx
            for d = 1:dimPk
                uhG(i,:) = uhG(i,:) + uh(i,d)*phiG(:,d)';
            end
        end
        uhG = reshape(uhG',Nx*NumGLP,1)';
        uhflash(end + 1,:) = uhG;
        T = [T;t];
        ii1 = ii1 + 1;
        figure(1);
        plot(Xc, uh(:,1), 'b-', 'LineWidth', 1);
        xlim([Xc(1), Xc(end)]);
        pause(0.001)
    end
    
    fprintf('%d  %d\n',t,max(abs(uh(:,1))))
     
end