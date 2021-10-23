clear
L_x=3;
L_y=4;
h=0.02;
n=(L_x-1)/h;
m=(L_y-1)/h;
x=1:h:L_x;
y=1:h:L_y;
for i=1:n+1
  for j=1:m+1
      u(i,j)=cos(y(j));
  end
end
%%%
factor=1/(4/h^2+7);
%%%
norm=1;
unew=u;
k=0;
while norm>1e-5
  for j=2:m
    for i=2:n
        unew(i,j)=factor*((u(i-1,j)+u(i+1,j)+u(i,j-1)+...
                  u(i,j+1))/h^2+x(i)^2-y(j)^2);
    end
    unew(n+1,j)=u(n,j)+2*h;
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