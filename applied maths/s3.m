%functions
z1=@(x,y)cos(x*y)-x+y^3;
z2=@(x,y)z1(x-y,x+y)-x*tan(x);
%answer
z1(1,5)
z2(1,5)