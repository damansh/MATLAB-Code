x=linspace(-2.5,2.5,1001);
y1=-1.*x.^4+2.*x.^3+x.^2-3.*x+5;
plot(x,y1);
hold on

xpts=[-2,-1,0,1,2];
ypts=[-17,6,5,4,3];

x2=polyfit(xpts,ypts,2);
y2=polyval(x2,x);
plot(x,y2);
hold on

x3=polyfit(xpts,ypts,3);
y3=polyval(x3,x);
plot(x,y3);
hold on

x4=polyfit(xpts,ypts,5);
y4=polyval(x4,x);
plot(x,y4);
hold on
legend('Quartic','Quadratic','Cubic','Quintic');