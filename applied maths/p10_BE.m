clear;
T=1;
u(1)=2;
%%%
tau=0.02;
t=0:tau:T;
m=T/tau;
%%%
for k=1:m
    u(k+1)=(u(k)+200*tau)/(1+200*tau);
end
plot(t,u)
axis([0 1 0 2])
grid on