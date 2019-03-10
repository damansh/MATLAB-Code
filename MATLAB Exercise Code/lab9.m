clear all

x=linspace(-2,2,1001);
y=x;

for i=1:length(x)
   for j=1:length(y)
      z(i,j) = x(i).*exp(-(x(i)).^2-(y(j)).^2);
   end
end

plot(x,z(:,1)); % g(x,-2)
hold on
plot(x,z(:,501)); % g(x,0)
hold on
plot(x,z(251,:)); % g(-1,y)
grid on
legend('g(x,-2)','g(x,0)','g(-1,y)');