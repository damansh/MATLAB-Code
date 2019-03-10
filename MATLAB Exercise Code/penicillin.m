x=linspace(0,50,10001);
xpts=[0 5 10 15 20];
ypts=[200 152 118 93 74];
plot(xpts,ypts);
hold on

x1=polyfit(xpts,ypts,4)
y1=polyval(x1,x);
plot(x,y1,'r:');
hold on

x2=200.*exp(x.*(-0.9942522733/20));
plot(x,x2);
hold on

plot(32.375,40,'ko');
hold on

plot(46.318,20,'kd');
hold on

legend('Original Data','Quartic Polynomial Function','Exponential Function','Penicillin Concentration = 40µg/mL','Penicillin Concentration = 20µg/mL');
xlabel('Time (minutes)');
ylabel('Penicillin Concentration (µg/ml)');
title('Chillin with the Penicillin');
axis([0 50 0 200]);

