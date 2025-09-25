% RK3.m
alpha = max(abs(uh));
dt = CFL*(hx)/alpha;
t = 0;

while t < tend
    
    if t + dt >= tend
        dt = tend - t;
        t = tend;
    else
        t = t + dt;
    end
    
    % Stage I
    du = Lh(uh);
    uh1 = uh + dt*du;
    
    % Stage II
    du = Lh(uh1);
    uh2 = (3/4)*uh + (1/4)*uh1 + (1/4)*dt*du;
  
    % Stage III
    du = Lh(uh2);
    uh = (1/3)*uh + (2/3)*uh2 + (2/3)*dt*du;

    figure(1)
    plot(Xc,uh,'b-','LineWidth',1)
    d = max(uh) - min(uh);
    axis([Xc(1),Xc(end),min(uh) - 0.05*d,max(uh) + 0.05*d])
    pause(0.001)
     
end
