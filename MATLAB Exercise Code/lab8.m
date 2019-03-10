n=101;
x=linspace(0,2*pi,n);
y=sin(x);
y_prime= diff(y)./diff(x);
delta_x=x(2)-x(1);
xd=linspace(x(1)+delta_x/2, x(end)-delta_x/2, n-1);
plot(xd,y_prime);
grid on
hold on
syms sym_x
sym_y=sin(sym_x)
sym_y_prime=diff(sym_y)
fplot(sym_y_prime)