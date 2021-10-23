clear
L=2;
T=3;
n=100;
m=15000;
%%%
h=L/n;
tau=T/m;
c=2*tau/h^2
%%%
x=0:h:L;
t=0:tau:T;
%%%
for i=1:n+1
    u(i,1)=1;
end
for k=1:m
    for i=2:n
        u(i,k+1)=(1-c)*u(i,k)+c/2*(u(i-1,k)+u(i+1,k))+tau*t(k);
    end
    u(1,k+1)=1;
    u(n+1,k+1)=1;
end
surf(x,t,u')
xlabel('x')
ylabel('t')
zlabel('u')
shading interp %to show surf colors