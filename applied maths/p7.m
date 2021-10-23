Lx=1;Ly=2;h=0.02;n=Lx/h;m=Ly/h;
%%%%%%
x=0:h:Lx+h;y=0:h:Ly;
%%%%%%
u=3*ones(n+2,m+1);norm=1;
factor=1/(4/h^2+2);
k=0;
u_new=u;
while norm>=1e-5
    for j=2:m
        for i=2:n+1
            u_new(i,j)=factor*(1/h^2*(u(i-1,j)+u(i+1,j)+u(i,j-1)+...
                u(i,j+1))+x(i)-y(j));
        end
        u_new(n+2,j)=u(n,j)+2*h;
    end
    norm=max(max(abs(u_new-u)));u=u_new;k=k+1;
end
k
%%%%%%
xplot=x(1:n+1);
uplot=u(1:n+1,:);
surf(xplot,y,uplot')
xlabel('x')
ylabel('y')
zlabel('u')