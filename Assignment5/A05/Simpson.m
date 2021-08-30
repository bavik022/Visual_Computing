f = @(x) 1/(1+(sinh(2*x))*((log(x))^2));
N = 100000;
b = 1;
a = 0;
del_x = (b - a)/N;
fsum = f(a+del_x) + f(b);
for i = 2:N-1
    xj = a + i*del_x;
    fsum = fsum + (3 - (-1)^i)*f(xj);
end
result = fsum*(del_x/3)
