% calculate_L2_Error.m

compute_real_solution;
uG = reshape(u,NumGLP,Nx)'; 

ureal = zeros(1,Nx); %average
for i = 1:Nx
    for j = 1:NumGLP
        ureal(i) = ureal(i) + 0.5*weight(j)*uG(i,j);
    end
end

uE = abs(uh - ureal);
L2_Error = 0;

for i = 1:Nx
    L2_Error = L2_Error + hx*(uE(i))^2;
end

L2_Error = sqrt(L2_Error);
