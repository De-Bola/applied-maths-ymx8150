clear;
Q=1e5;
r=0.42;
%%%
tau=0.01;
T=20;
m=T/tau;
%%%
t=0:tau:T;
N(1)=250;
for k=1:m
    N(k+1)=N(k)+tau*r*N(k)*(Q-N(k))/Q;
end
answer=N(1+m)
plot(t,N)
grid on