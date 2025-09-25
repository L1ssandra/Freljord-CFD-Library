% init_data.m
global hx hx1

xa = 0;
xb = 2*pi;
u0 = @(x) 0.5 + sin(x);
tend = 0.6;

hx = (xb - xa)/Nx;
hx1 = 0.5*hx;

Xc = xa + hx1:hx:xb - hx1;

uh = zeros(1,Nx);

% for i = 1:Nx
%     for j = 1:NumGLP
%         uh(i) = uh(i) + 0.5*weight(j)*u0(Xc(i) + hx1*lambda(j));
%     end
% end
for i = 1:Nx  
    % uh(i) = (0.5*hx - cos(Xc(i) + hx1) + cos(Xc(i) - hx1))/hx;
    uh(i) = 0.5 + (-cos(Xc(i) + hx1) + cos(Xc(i) - hx1))/hx;
end