close all;
%Initializing the Color Map
color_map =    [1,2,4,1;
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
        Z(sample_x(i),sample_y(j))=color_map(i,j);
        %fprintf("Z(%d,%d)=%d\n",i-1,j-1,color_map(i,j));
    end
end

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
            
            a=(x(i)-xn)/(xp-xn);
            b=(y(j)-yn)/(yp-yn);
            xp=sample_x(xp+1);xn=sample_x(xn+1);
            yp=sample_y(yp+1);yn=sample_y(yn+1);
            Z(i,j)=(1-a)*(1-b)*Z(xn,yn) + a*(1-b)*Z(xp,yn) + (1-a)*b*Z(xn,yp) + a*b*Z(xp,yp);
        end
        
    end
end
surf(Z,'EdgeColor','None'); colormap default; colorbar;
title('Bilinear Interpolation');
xlabel('X');
ylabel('Y');
zlabel('Z');


