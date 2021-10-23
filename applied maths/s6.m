x=0;
x1=1;
while abs(x-x1)>=1e-7
    x2=cos(x);
    x1=x;
    x=x2;
end
x