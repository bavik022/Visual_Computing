ds = 0.001;
fx = @(t) sin(t);
a = 0;
b = 200;
N = (b - a)/ds;
s = linspace(a, b, N);
dt = 0.001;
t = linspace(0, dt*N, N);
x_stream = zeros(N,1);
y_stream = zeros(N,1);
x_path = zeros(N, 1);
y_path = zeros(N, 1);
for i=2:N
    x_stream(i) = x_stream(i-1) + ds*fx(3*pi/2);
    y_stream(i) = y_stream(i-1) + ds;
    x_path(i) = x_path(i-1) + dt*fx(t(i-1));
    y_path(i) = y_path(i-1) + dt;
end
%plot(x_stream, y_stream);
hold on
%quiver(x_path, y_path);
plot3(x_path, y_path,t);

