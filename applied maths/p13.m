clear
%%%wave discretization
L=2;
T=8;
n=500;
m=2000;
%%%
h=L/n;
tau=T/m;
%%%
x=0:h:L;
t=0:tau:T;
%%%
c=tau/h;
for i=1:n+1
    u(i,1)=x(i)*(2-x(i));
    u(i,2)=u(i,1)-tau^2;
end
for k=2:m
    u(1,k+1)=0;
    for i=2:n
        u(i,k+1)=2*(1-c^2)*u(i,k)+c^2*(u(i-1,k)+u(i+1,k))-u(i,k-1);
    end
    u(n+1,k+1)=0;
end
%%%
surf(x,t,u')
xlabel('x')
ylabel('t')
zlabel('u')
shading interp