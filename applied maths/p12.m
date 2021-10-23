clear;
%%%using cranck-nicolson scheme
f=@(x,t)x^2*(x-1)*cos(t)-(6*x-2)*sin(t);
n=50;
m=50;
h=1/n;
tau=1/m;
%%%
x=0:h:1;
t=0:tau:1;
%%%
c=tau/(2*h^2);
%%%
for i=1:n+1
    u(i,1)=0;
end
A=zeros(n+1,n+1);
A(1,1)=1;
for i=2:n
    A(i,i-1)=-c;
    A(i,i)=1+2*c;
    A(i,i+1)=-c;
end
A(n+1,n+1)=1;
%%%
for k=1:m
    y(1)=0;
    for i=2:n
        y(i)=c*u(i-1,k)+(1-2*c)*u(i,k)+c*u(i+1,k)+...
            +tau/2*(f(x(i),t(k))+f(x(i),t(k+1)));
    end
    y(n+1)=0;
    u(:,k+1)=A\y';
end
%%%
surf(x,t,u')
xlabel('x')
ylabel('t')
zlabel('u')
%error computation
for k=1:m+1
    for i=1:n+1
        exact_u(i,k)=x(i)^2*(x(i)-1)*sin(t(k));
    end
end
max_error=max(max(abs(u-exact_u)))