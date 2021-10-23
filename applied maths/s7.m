%function
x=1:5e-1:3;
y=cos(x).*x.^2;
plot(x,y)
xlabel('x')
ylabel('y')
grid on