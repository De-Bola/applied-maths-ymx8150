clear
%%%%%%
Lx=3;
Ly=4;
h=0.02;
n=(Lx-1)/h;
m=(Ly-1)/h;
%%%%%%
x=1:h:Lx;
y=1:h:Ly;
v=1/h^2;
%%%%%%
for i=1:n+1
    for j=1:m+1
        u(i,j)=cos(y(j));
    end
end
%%%%%%
norm=1;factor=1/(4/h^2+7);k=0;u_new=u;
while norm>=1e-5
    for j=2:m
        for i=2:n
            u_new(i,j)=factor*((v*(u(i-1,j)+u(i+1,j)+u(i,j-1)+...
                u(i,j+1)))+x(i)^2-y(j)^2);
        end
    end
    norm=max(max(abs(u_new-u)));u=u_new;k=k+1;
end
k
%%%%%%
surf(x,y,u')
xlabel('x')
ylabel('y')
zlabel('u')