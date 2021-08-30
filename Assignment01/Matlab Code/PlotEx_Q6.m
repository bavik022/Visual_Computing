t1 = linspace(0, 1, 1000);
t2 = linspace(1, 6, 1000);
y1 = t1.^2;
y2 = t2.^3;
t = [t1, t2];
y = [y1, y2];
figure
plot(t,y);