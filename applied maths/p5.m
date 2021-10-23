clear;
n=200;
h=2/n;
x=-1:h:1;
%%%%%
A=zeros(n+1,n+1);
A(1,1)=3/h+h/2*exp(x(1));
A(1,2)=-3/h;
y(1)=h/2*(x(1)-1)-3;
for i=2:n
    A(i,i-1)=-3/h;
    A(i,i)=6/h+h*exp(x(i));
    A(i,i+1)=-3/h;
    y(i)=h*(x(i)-1);
end
A(n+1,n)=-3/h;
A(n+1,n+1)=3/h+h/2*exp(x(n+1));
y(n+1)=h/2*(x(n+1)-1)-3;
%%%%%
u=A\y';
%%%%%
plot(x,u)
xlabel('x')
ylabel('u')
grid on