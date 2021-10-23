clear
%%%%%%
Lx=2;Ly=1;n=50;hx=Lx/n;hy=Ly/n;
%%%%%%
x=0:hx:Lx;y=0:hy:Ly;
w=1/hx^2;v=1/hy^2;
%%%%%%
for i=1:n+1
    for j=1:n+1
        u(i,j)=2+0.5*sin(2*x(i)*y(j));
    end
end
%%%%%%
norm=1;factor=1/(2/hx^2+2/hy^2+1);k=0;u_new=u;
while norm>=1e-7
    for j=2:n
        for i=2:n
            u_new(i,j)=factor*((w*u(i-1,j)+u(i+1,j))+(v*u(i,j-1)+...
                u(i,j+1))-x(i)*y(j));
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