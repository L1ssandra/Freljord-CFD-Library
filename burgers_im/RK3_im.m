% RK3.m

alpha = max(abs(uh(:,1)));
dt = CFL*hx/alpha;
t = 0;

frameMAX = 1000;
T = t;
uflash = uh(:,1)';
t1 = tend/frameMAX;
i1 = 1;

while t < tend
    
    if t + dt >= tend
        dt = tend - t;
        t = tend;
    else
        t = t + dt;
    end
    
    % Stage I
    uh1 = BackEuler(uh,dt);
    % uh1 = TVD_Limiter(uh1);
    
    % Stage II
    uh2 = (3/4)*uh + (1/4)*BackEuler(uh1,dt);
    % uh2 = TVD_Limiter(uh2);
    
    % Stage III
    uh = (1/3)*uh + (2/3)*BackEuler(uh2,dt);
    % uh = TVD_Limiter(uh);
    
    fprintf('%d  %d\n',t,max(abs(uh(:,1))))

    
    if t >= i1*t1
        T = [T;t];
        uflash = [uflash;uh(:,1)'];
        i1 = i1 + 1;
    end
     
end