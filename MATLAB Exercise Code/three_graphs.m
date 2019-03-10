t=linspace(0,10,10001);
figure('Name','Measured Data');
for a=1.8:0.1:2
   y=(1000/a)*exp(0.5.*a.*t);
   b = sprintf('a = %f', a)
   plot(t,y,'DisplayName',b);
   hold on
end
xlabel('Time (hours)');
ylabel('Population');
title('Bacteria Growth and Interpretation');
legend('show');
