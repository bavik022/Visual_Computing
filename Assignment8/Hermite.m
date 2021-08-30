H0 = @(x) (2*x+1)*((1-x)^2);
H1 = @(x) x*((1-x)^2);
H2 = @(x) -(x^2)*(1-x);
H3 = @(x) (3-2*x)*(x^2);
n = 100;
t = linspace(0, 1, 100);
x=zeros(100,1);
y=zeros(100,1);
pts = zeros(100,2);
p0 = [0;0];
p1 = [2;0];
m0 = [1;1];
m1 = [0;1];
for i=1:n
    
    h0 = H0(t(i));
    h1 = H1(t(i));
    h2 = H2(t(i));
    h3 = H3(t(i));
    pts(i,1) = H0(t(i))*p0(1) + H1(t(i))*m0(1) + H2(t(i))*m1(1) + H3(t(i))*p1(1);
    pts(i,2) = H0(t(i))*p0(2) + H1(t(i))*m0(2) + H2(t(i))*m1(2) + H3(t(i))*p1(2);
end

plot3(pts(:,1),pts(:,2),t,'r','LineWidth',2);
title('Cubic Interpolation');
xlabel('X');
ylabel('Y');
zlabel('t');
    