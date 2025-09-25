global Nx

Nx0 = 10;
count = 6;
Table = zeros(6,2);

for nn = 1:6
    Nx = Nx0*2^(nn - 1);
    main  
    Table(nn,1) = L2_Error; 
    if nn > 1
        Table(nn,2) = log(Table(nn - 1,1)/Table(nn,1))/log(2);
    end
end

