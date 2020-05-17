function dx=Lorentz(t,x)
global a;
global b ;
global c;
dx = [a*(x(2)-x(1)); b*x(1)-x(2)-x(1)*x(3); -c*x(3)+x(1)*x(2)];
