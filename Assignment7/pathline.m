a=0;
b=200;
N=(b-a)/0.001;
dy = 0.001;
dt = dy;
y = linspace(a, b, N);
t = linspace(0, 30*pi, N);
fx = @(y, t) sin(t);
x_stream = zeros(N, 1);
y_path = zeros(N, 1);
x_path = zeros(N, 1);
for i = 2:N
    x_stream(i) = fx(y(i-1), 3*pi/2) + dy*fx(y(i-1), 3*pi/2);
    y_path(i) = t(i);
    x_path(i) = sin(t(i-1)) + dt*sin(t(i-1));
end
% plot(x_stream, y);
% hold on
plot(x_path(1:1000:N), y_path(1:1000:N), 'r');
hold on 
quiver(x_path(1:1000:N), y_path(1:1000:N), 'b');
