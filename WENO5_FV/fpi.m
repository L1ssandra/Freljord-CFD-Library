function xc = fpi(g,x0,tol,N)

x = g(x0);
n = 1;
while abs(x - x0) > tol && n < N
    x0 = x;
    x = g(x0);
    n = n + 1;
end
xc = x;


end