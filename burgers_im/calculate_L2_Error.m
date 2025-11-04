% calculate_L2_Error.m
uhG = zeros(Nx,NumGLP);

for i = 1:Nx
    for d = 1:dimPk
        uhG(i,:) = uhG(i,:) + uh(i,d)*phiG(:,d)';
    end
end

for i = 1:Nx
    for i1 = 1:NumGLP
        ureal(i,i1) = calculate_burgers(Xc(i) + hx1 * lambda(i1), tend, 0.5, 1);
    end
end

uE = abs(uhG - ureal);
L2_Error = 0;

for i = 1:Nx
    for i1 = 1:NumGLP
        L2_Error = L2_Error + hx1*weight(i1)*uE(i,i1)^2;
    end
end
L2_Error = sqrt(L2_Error);