
figure(1)
t0 = T(end)/frameMAX;
for i = 1:frameMAX + 1
    tt = (i - 1)*t0;
    [~,j] = min(abs(T - tt));
    u = zeros(1,Nx);
    for ii = 1:Nx
        u(ii) = u0t(Xc(ii), T(j));
    end
    plot(Xc,u,'k-',Xc,uflash(j,:),'b--','LineWidth',1);
    axis([Xc(1),Xc(end),min(min(uflash)) - 0.1,max(max(uflash)) + 0.1]);
    pause(0.001);
end