% L2_Pro.m
uh = zeros(Nx,dimPk);
uhf1 = zeros(Nx,dimPk);
uhf2 = zeros(Nx,dimPk);

for i = 1:Nx
    for d = 1:dimPk
        for i1 = 1:NumGLP
            uhf2(i,d) = uhf2(i,d) + 0.5*weight(i1)*u0t(Xc(i) + hx1*lambda(i1),0*dt)*phiG(i1,d)/mm(d);
            uhf1(i,d) = uhf1(i,d) + 0.5*weight(i1)*u0t(Xc(i) + hx1*lambda(i1),1*dt)*phiG(i1,d)/mm(d);
            uh(i,d) = uh(i,d) + 0.5*weight(i1)*u0t(Xc(i) + hx1*lambda(i1),2*dt)*phiG(i1,d)/mm(d);
        end
    end
end

% for d = 1:dimPk
%     uh(:,d) = uh(:,d)/mm(d);
% end