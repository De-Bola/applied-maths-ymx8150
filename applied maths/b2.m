clear
L_x=3;
L_y=4;
hx=0.02;
hy=0.02;
n=(L_x-1)/hx;
m=(L_y-1)/hy;
x=1:hx:L_x;
y=1:hy:L_y;
for i=1:n+1
  for j=1:m+1
      u(i,j)=cos(y(j));
  end
end
%%%
factor=1/(4/hx^2+2);
%%%
norm=1;
unew=u;
k=0;
while norm>1e-5
  for j=2:m
    for i=2:n
        unew(i,j)=factor*((u(i-1,j)+u(i+1,j))/hx^2+(u(i,j-1)+...
                  u(i,j+1))/hy^2-x(i)-y(j));
    end
    unew(n+1,j)=u(n,j)+2*hx;
  end
norm=max(max(abs(unew-u)));
k=k+1;
u=unew;
end
k
surf(x,y,u')
xlabel('x')
ylabel('y')
zlabel('u')