clear
L_x=3;
L_y=4;
hx=0.02;
hy=0.02;
n = L_x/hx;
m = L_y/hy;
x=0:hx:L_x;
y=0:hy:L_y;
for i=1:n+1
  for j=1:m+1
  u(i,j)=cos(y(j));
  end
end
%%%
factor=1/(2/hx^2+2/hy^2+7);
%%%
norm=1;
unew=u;
k=0;
while norm>1e-7
  for j=2:m
    for i=2:n
        unew(i,j)=factor*((u(i-1,j)+u(i+1,j))/hx^2+(u(i,j-1)+...
                  u(i,j+1))/hy^2+(x(i)^2)-(y(j)^2));
    end
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