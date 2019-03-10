load census
x=linspace(1790,1990,10001);
%x=linspace(1790,1990,100001);
plot(cdate,pop)
hold on

x1=polyfit(cdate,pop,4);
y1=polyval(x1,x);
plot(x,y1);
hold on

x2=polyfit(cdate,pop,5);
y2=polyval(x2,x);
plot(x,y2);
hold on
legend('Original Data','First Regression','Second Regression')