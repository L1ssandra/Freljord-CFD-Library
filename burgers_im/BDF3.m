% BDF3.m

alpha = max(max(abs(ureal)));
dt0 = CFL*hx/alpha;
Nt = ceil(tend/dt0);
dt = tend/Nt;
t = 2*dt;

L2_Pro;

frameMAX = 1000;
T = t;
uflash = uh(:,1)';
t1 = tend/frameMAX;
i1 = 1;

while t < tend - 1e-10
    
    % if t + dt >= tend
    %     dt = tend - t;
    %     t = tend;
    % else
    %     t = t + dt;
    % end

    t = t + dt;
    
    % Stage I
    ustar = 18/11*uh - 9/11*uhf1 + 2/11*uhf2;
    uhnew = BackEuler(ustar,6/11*dt);

    uhf2 = uhf1;
    uhf1 = uh;
    uh = uhnew;
    
    fprintf('%d  %d\n',t,max(abs(uh(:,1))))

    if t >= i1*t1
        T = [T;t];
        uflash = [uflash;uh(:,1)'];
        i1 = i1 + 1;
    end
     
end