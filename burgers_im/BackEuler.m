function uhnew = BackEuler(uh, dt)

global Nx dimPk NumGLP phiG weight

uhold = uh;
Niter = 100;
niter = 1;
eps = 1e-12;
Error = 1;

while niter <= Niter && Error > eps

    % iteration
    du = Lh(uhold);
    uhnew = uh + dt * du;

    % calculate L2 error
    Error = 0;
    uhGold = zeros(Nx, NumGLP);
    uhGnew = zeros(Nx, NumGLP);

    for i = 1:Nx
        for d = 1:dimPk
            uhGold(i,:) = uhGold(i,:) + uhold(i,d) * phiG(:,d)';
            uhGnew(i,:) = uhGnew(i,:) + uhnew(i,d) * phiG(:,d)';
        end
    end

    uE = abs(uhGnew - uhGold);

    for i = 1:Nx
        for i1 = 1:NumGLP
            Error = Error + 0.5 * weight(i1) * uE(i,i1)^2;
        end
    end
    Error = sqrt(Error / Nx);
    % fprintf("%d  %d\n",niter,Error);

    uhold = uhnew;

    niter = niter + 1;

end

end