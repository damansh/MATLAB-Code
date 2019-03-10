plot(robpos(:,2),robpos(:,3), 'o');
title('y(t) vs x(t)')
hold all
plot(robpos(:,2),robpos(:,3));
% figure
% plot(robpos(:,1),robpos(:,2));
% title('x(t) vs time')
% figure 
% plot(robpos(:,1),robpos(:,3));
% title('y(t) vs time')
t = linspace(0,60,61);
for i=1:60
    velocity(i) = sqrt((robpos(i+1,2)-robpos(i,2)).^2 + (robpos(i+1,3)-robpos(i,3)).^2);
    velocityx(i) = (robpos(i+1,2)-robpos(i,2)).^2;
    velocityy(i) = (robpos(i+1,3)-robpos(i,3)).^2;
end

for k=1:59
  % acceleration(k) = velocity(1,k) - velocity(1,k-1);
  acceleration(k) = sqrt((velocityx(1,k+1)-velocityx(1,k)).^2 + (velocityy(1,k+1)-velocityy(1,k)).^2);
end

figure
plot(transpose(robpos(1:60,1)),velocity(1,:))
title('Velocity vs Time (Raw Data)');
xlabel('Time (seconds)');
ylabel('Velocity (m/s)');

figure
plot(transpose(robpos(1:59,1)),acceleration(1,:))
title('Acceleration vs Time (Raw Data)');
xlabel('Time (seconds)');
ylabel('Acceleration (m/s/s)');

figure
a=polyfit(t(1,1:59),velocity(1,1:59),10);
x1 = 0:0.1:60;
y1 = polyval(a,x1);
plot(x1,y1);
title('Velocity vs Time (Smooth Data)');
xlabel('Time (seconds)');
ylabel('Velocity (m/s)');

figure
b=polyfit(t(1,1:59),acceleration(1,:),10);
x2 = 0:0.1:60;
y2 = polyval(b,x2);
plot(x2,y2);
title('Acceleration vs Time (Smooth Data)');
xlabel('Time (seconds)');
ylabel('Acceleration (m/s/s)');

% Part C: Path Control
x1 = [linspace(0,1.19999,15) linspace(1.2,0.00001,15) linspace(0,-1.1999,15) linspace(-1.2,0,16)];

for c=1:61
   if 0<=c & c<=15
       y(c) = -sqrt(1.2.^2-(x1(1,c)).^2)+1.2;   
   elseif 15<c & c<=45
       y(c) = sqrt(1.2.^2-(x1(1,c)).^2)+1.2;
   else 45<c & c<=61
       y(c) = -sqrt(1.2.^2-(x1(1,c)).^2)+1.2;
   end
end

pos = [t;x1;y];

% Velocity
i=0;
for i=1:60
    velocitypos(i) = sqrt((pos(2,i+1)-pos(2,i)).^2 + (pos(3,i+1)-pos(3,i)).^2);
    velocityposx(i) = (pos(2,i+1)-pos(2,i)).^2;
    velocityposy(i) = (pos(3,i+1)-pos(3,i)).^2;
end

% Acceleration
k=0;
for k=1:59
  % acceleration(k) = velocity(1,k) - velocity(1,k-1);
  accelerationpos(k) = sqrt((velocityposx(1,k+1)-velocityposx(1,k)).^2 + (velocityposy(1,k+1)-velocityposy(1,k)).^2);
end

figure 
plot(x1(1,:),y(1,:));
title('Position of Robot in 2D Space (Path Control)');
xlabel('X-coordinate (m)');
ylabel('Y-coordinate (m)');

figure
plot(pos(1,1:60),velocitypos(1,:))
title('Velocity vs Time (Path Control)');
xlabel('Time (seconds)');
ylabel('Velocity (m/s)');

figure
plot(pos(1,1:59),accelerationpos(1,:))
title('Acceleration vs Time (Path Control)');
xlabel('Time (seconds)');
ylabel('Acceleration (m/s/s)');

figure
c=polyfit(t(1,1:59),velocitypos(1,1:59),7);
x3 = 0:0.1:60;
y3 = polyval(c,x3);
plot(x3,y3);
title('Velocity vs Time (Path Control) SMOOTH');
xlabel('Time (seconds)');
ylabel('Velocity (m/s)');

figure
d=polyfit(t(1,1:59),accelerationpos(1,1:59),3);
x4 = 0:0.1:60;
y4 = polyval(d,x4);
plot(x4,y4);
title('Acceleration vs Time (Path Control) SMOOTH');
xlabel('Time (seconds)');
ylabel('Acceleration (m/s/s)');