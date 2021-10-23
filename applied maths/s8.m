x=1:1e-2:3;
y=0:1e-1:2;
[x,y]=meshgrid(x,y);
z=x.^2+3*y.^2;
surf(x,y,z)
shading('interp')