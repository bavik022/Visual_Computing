% Q3.2

%% 3D surface plot:

len=100;
x= linspace(-5,5,len);
y= linspace(-5,5,len);
fx = zeros(len);
for i=1:len
for j=1:len
fx(i,j)=exp(-2*x(i)*x(i)-2*y(j)*y(j)+4*x(i)+2*y(j)-3);
end
end
surf(x,y,fx)

%% Tangent on surface:

a=1;b=1;
Fx = exp(-2*a*a-2*b*b+4*a+2*b-3)
p=100;
tangent = ones(p);
for i=1:100
for j=1:100
tangent(i,j)=Fx*(1+(4-4*x(i))*(x(i)-a)+(2-4*y(j)*(y(j)-b)));
end
end
surf(x,y,fx);
hold on;
surf(x,y,tangent);


% Q3.3

x=linspace(-10,10,100);
y=linspace(-10,10,100);
z=zeros(100);
for i=1:100
for j=1:100
z(i,j)=(x(i)^2)-6*(x(i)^2)*y(j)+2*(y(j)^3);
end
end
surf(x,y,z)

