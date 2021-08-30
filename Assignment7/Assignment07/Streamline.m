ds = 0.001;
dt = 0.001;
fx = @(t) sin(t);
fx1 = @(t,y) -cos(t)+cos(t-y);
a = 0; b = 200;
N = (b - a)/ds;
s = linspace(a, b, N);
t = linspace(0, b, N);
x_stream = zeros(N,1);
x_path = zeros(N, 1);
x_streak =zeros(N, 1);
y = zeros(N,1);
for i=2:N
    x_stream(i) = x_stream(i-1) + ds*fx(3*pi/2); %Euler steps on streamline eq
    x_path(i) = x_path(i-1) + dt*fx(t(i-1)); %Euler steps on pathline eq
    x_streak(i) = fx1(1.5*pi,s(i)); %Substituting values in the Streakline eq
    y(i) =  y(i-1) + dt;
end

hold on
plot(x_stream, y,'r');
plot(x_path, y,'g');
plot(x_streak, y,'b');

