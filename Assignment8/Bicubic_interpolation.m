
%Initializing the Color Map
f =    [1,2,4,1;
    6,3,5,2;
    4,2,1,5;
    5,4,2,3] ;

N=100;
x=linspace(0,3,N);
y=linspace(0,3,N);
Z = zeros(N);
sample_x=zeros(4,1);
sample_y=zeros(4,1);

%locate the index of sample positions in the linear map of points
for i=0:3
    sample_x(i+1)=find(x==i);
    sample_y(i+1)=find(y==i);
end

for i=1:4
    for j=1:4
        Z(sample_x(i),sample_y(j))=f(i,j);
    end
end

fx=zeros(4);
fy=zeros(4);
fxy=zeros(4);
for i=1:4
    for j=1:4
        if i>1 && i<4
            fy(i,j)= (f(i+1,j)-f(i-1,j))/2;
        else
            fy(i,j)=0;
        end
        
        if j>1 && j<4
            fx(i,j)= (f(i,j+1)-f(i,j-1))/2;
        else
            fx(i,j)=0;
        end
    end
end


for i=1:4
    for j=1:4
        if j>1 && j<4
            fxy(i,j)= (fy(i,j+1)-fy(i,j-1))/2;
        else
            fxy(i,j)=0;
        end
    end
end
A = [1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0;-3,3,0,0,-2,-2,0,0,0,0,0,0,0,0,0,0;2,-2,0,0,1,1,0,0,0,0,0,0,0,0,0,0;0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0;0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0;0,0,0,0,0,0,0,0,-3,3,0,0,-2,-1,0,0;0,0,0,0,0,0,0,0,2,-2,0,0,1,1,0,0;-3,0,3,0,0,0,0,0,-2,0,-1,0,0,0,0,0;0,0,0,0,-3,0,3,0,0,0,0,0,-2,0,-2,0;9,-9,-9,9,6,3,-6,-3,6,-6,3,-3,4,2,2,1;-6,6,6,-6,-3,-3,3,3,-4,4,-2,2,-2,-2,-1,-1;2,0,-2,0,0,0,0,0,1,0,1,0,0,0,0,0; 0,0,0,0,2,0,-2,0,0,0,0,0,1,0,1,0;-6,6,6,-6,-4,-2,4,2,-3,3,-3,3, -2,-1,-2,-1;4,-4,-4,4,2,2,-2,-2,2,-2,2,-2,1,1,1,1];
B= [1,0,0,0;0,0,1,0;-3,3,-2,-1;2,-2,1,1];
Bt=transpose(B);
for i=1:N
    for j=1:N
        
        if Z(i,j) == 0
            if floor(x(i))==3
                xp=3;
                xn=2;
            else
                xn=floor(x(i));
                xp=xn+1;
            end
            if floor(y(j))==3
                yn=2;
                yp=3;
            else
                yn=floor(y(j));
                yp=yn+1;
            end
            
            f00=f(xn+1,yn+1);
            f01=f(xn+1,yp+1);
            f10=f(xp+1,yn+1);
            f11=f(xp+1,yp+1);
            
            fx00=fx(xn+1,yn+1);
            fx01=fx(xn+1,yp+1);
            fx10=fx(xp+1,yn+1);
            fx11=fx(xp+1,yp+1);
            
            fy00=fy(xn+1,yn+1);
            fy01=fy(xn+1,yp+1);
            fy10=fy(xp+1,yn+1);
            fy11=fy(xp+1,yp+1);
            
            fxy00=fxy(xn+1,yn+1);
            fxy01=fxy(xn+1,yp+1);
            fxy10=fxy(xp+1,yn+1);
            fxy11=fxy(xp+1,yp+1);
            
            X1=transpose([f00,f10,f01,f11,fx00,fx10,fx01,fx11,fy00,fy10,fy01,fy11,fxy00,fxy10,fxy01,fxy11]);
            M = [f00,f01,fy00,fy01;f10,f11,fy10,fy11;fx00,fx01,fxy00,fxy01;fx10,fx11,fxy10,fxy11];
            X=[1,x(i),x(i)^2,x(i)^3];
            Y=transpose([1,y(j),y(j)^2,y(j)^3]);
            alpha=A*X1;
            alpha=vec2mat(alpha,4);
            Z(i,j)=X*(alpha)*Y;
        end
        
    end
end
surf(Z,'EdgeColor','None'); colormap default;
