trials = 10
res = zeros(trials,1);
N = 10000;
a=0;b=1;
for i=1:trials
% N random points in the interval [0,1]
x_i =rand(N,1);
integral=0;
for k=1:N
    integral=integral+f(x_i(k));
end
res(i)= ((b-a)/N)*integral;
end

%Error
SD = zeros(trials,1);
for i=1:trials
    SD(i) = std(res(1:i));
end
res
SD

function func = f(x)
func = 1/(1+sinh(2*x)*(log(x)^2));
end
