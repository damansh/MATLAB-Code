% ENGINEERING PROBLEM #6 - ROBOT MOVEMENT AND CONTROL
% DAMAN SHARMA - 1004179998

% OPEN ROBPOS.MAT FILE

%% Part A - Original Data of the Robot & Part B - Polynomial Curve Fitting

% Defining two variables of time. One with 61 points and the other with 480
% points.
time = linspace(0,60,61);
t = linspace(0,60,480);

% Plot of Position of Robot in 2D Space (x(t) vs. y(t))
figure('Name','Part A - Original Data of the Robot & Part B - Polynomial Curve Fitting');
subplot(2,2,[1 2]);
plot(robpos(:,2),robpos(:,3));
title('Position of Robot Through 2D Space')
xlabel('X-coordinate (m)');
ylabel('Y-coordinate (m)');
% Utilizing a Polynomial Curve Fitting Technique to produce a smooth graph of the position of
% the robot in 2D space.
hold all
l = polyfit(robpos(:,1),robpos(:,2),10);
s = polyval(l,robpos(:,1));
g = polyfit(robpos(:,1),robpos(:,3),10);
f = polyval(g,robpos(:,1));
plot(s,f);
legend('Raw Data','Smooth Curve');

% Determining the velocity in the x and y direction and the overall
% velocity
velocityx = diff(robpos(:,2));
velocityy = diff(robpos(:,3));
velocity = transpose(sqrt(velocityx.^2 + velocityy.^2));

% Determining the overall acceleration of the robot
acceleration = diff(velocity);

% Plot of Overall Velocity vs Time of the Raw Data
subplot(2,2,3);
plot(transpose(robpos(1:60,1)),velocity(1,:))
title('Overall Velocity vs Time');
xlabel('Time (seconds)');
ylabel('Velocity (m/s)');
% Producing a smooth velocity vs. time graph based on the raw data.
hold all
a=polyfit(time(1,1:60),velocity(1,1:60),8);
x0 = 0:0.1:60;
y1 = polyval(a,x0);
plot(x0,y1);
legend('Raw Data','Smooth Curve');

% Plot of Overall Acceleration vs Time of the Raw Data
subplot(2,2,4);
plot(transpose(robpos(1:59,1)), acceleration);
title('Overall Acceleration vs Time');
xlabel('Time (seconds)');
ylabel('Acceleration (m/s/s)');
% Producing a smooth acceleration vs. time graph based on the raw data.
hold all
b=polyfit(time(1,1:59),acceleration,10); %4
x2 = 0:0.1:58;
y2 = polyval(b,x2);
plot(x2,y2);
legend('Raw Data','Smooth Curve');

% Plot of Velocity in the X-Direction vs Time of the Raw Data
figure('Name','Part A - Original Data of the Robot & Part B - Polynomial Curve Fitting');
subplot(2,2,1);
plot(time(1,1:60),velocityx(1:60,1));
title('Velocity in the X-Direction vs Time');
xlabel('Time (seconds)');
ylabel('Velocity (m/s)');
% Producing a smooth velocity in the x-direction vs. time graph based on the raw data.
hold all
p = polyfit(time(1,1:60),transpose(velocityx(1:60,1)),10);
p1 = polyval(p,time(1,1:60));
plot(time(1,1:60),p1);
legend('Raw Data','Smooth Curve');

% Plot of Velocity in the Y-Direction vs Time of the Raw Data
subplot(2,2,2);
plot(time(1,1:60),velocityy(1:60,1));
title('Velocity in the Y-Direction vs Time');
xlabel('Time (seconds)');
ylabel('Velocity (m/s)');
% Producing a smooth velocity in the y-direction vs. time graph based on the raw data.
hold all
q = polyfit(time(1,1:60),transpose(velocityy(1:60,1)),10);
q1 = polyval(q,time(1,1:60));
plot(time(1,1:60),q1);
legend('Raw Data','Smooth Curve');

% Plot of Acceleration in the X-Direction vs Time of the Raw Data
subplot(2,2,3);
plot(time(1,1:59),diff(velocityx(1:60,1)));
title('Acceleration in the X-Direction vs Time');
xlabel('Time (seconds)');
ylabel('Acceleration (m/s/s)');
% Producing a smooth acceleration in the x-direction vs. time graph based on the raw data.
hold all
a1 = polyfit(time(1,1:59),transpose(diff(velocityx(1:60,1))),10);
a11 = polyval(a1,time(1,1:60));
plot(time(1,1:60),a11);
legend('Raw Data','Smooth Curve');

% Plot of Acceleration in the Y-Direction vs Time of the Raw Data
subplot(2,2,4);
plot(time(1,1:59),diff(velocityy(1:60,1)));
title('Acceleration in the Y-Direction vs Time');
xlabel('Time (seconds)');
ylabel('Acceleration (m/s/s)');
% Producing a smooth velocity in the y-direction vs. time graph based on the raw data.
hold all
w = polyfit(time(1,1:59),transpose(diff(velocityy(1:60,1))),10);
w1 = polyval(w,time(1,1:59));
plot(time(1,1:59),w1);
legend('Raw Data','Smooth Curve');

%% Part C - Path Control 
% Determining the x-values of the position in 2D space by utilizing
% linspace to create a specific range. 
x1 = [linspace(0,1.19999,120) linspace(1.2,0.00001,120) linspace(0,-1.1999,120) linspace(-1.2,0,120)];

% Utilizing the equation of a circle (x^2 + (y-1.2)^2 = 1.2^2) in terms of
% y to determine the y-values based on the x-values
for c=1:480
   if 0<=c & c<=120;
       y(c) = -sqrt(1.2.^2-(x1(1,c)).^2)+1.2;   
   elseif 120<c & c<=360;
       y(c) = sqrt(1.2.^2-(x1(1,c)).^2)+1.2;
   else 360<c & c<=480;
       y(c) = -sqrt(1.2.^2-(x1(1,c)).^2)+1.2;
   end
end

% Creating a matrix with the time, x-values and the y-values. 
pos = [t;x1;y];

% Utilizing the matrix 'pos' to determine the velocity in the x and y
% direction and the overall velocity. 
velocityposx = diff(pos(2,:));
velocityposy = diff(pos(3,:));
velocitypos = sqrt(velocityposx.^2 + velocityposy.^2);

% Utilizing 'diff' command to determine the overall acceleration of the
% robot in the circular path. 
accelerationpos = diff(velocitypos);

% Plot of the position of the robot in 2D space (x(t) vs. y(t))
figure('Name','Part C - Path Control (Circular Path)');
plot(x1(1,:),y(1,:));
title('Position of Robot in 2D Space (Circular Path)');
xlabel('X-coordinate (m)');
ylabel('Y-coordinate (m)');

% Creating a smooth time vs. velocity in the x-direction graph by
% determining an accurate fit of the original x-direction velocity values. 
figure('Name','Part C - Path Control (Circular Path)');
subplot(2,2,1);
plot(pos(1,1:479),polyval(polyfit(pos(1,1:479),velocityposx(1,:),4),pos(1,1:479)));
title('Velocity in the X-Direction vs Time');
xlabel('Time (seconds)');
ylabel('Velocity (m/s)');

% Creating a smooth time vs. velocity in the y-direction graph by
% determining an accurate fit of the original y-direction velocity values. 
subplot(2,2,2);
plot(pos(1,1:479),polyval(polyfit(pos(1,1:479),velocityposy(1,:),4),pos(1,1:479)));
title('Velocity in the Y-Direction vs Time');
xlabel('Time (seconds)');
ylabel('Velocity (m/s)');

% Creating a smooth time vs. acceleration in the x-direction graph by
% using the 'diff' command to find the difference between the velocity values. 
% Afterwards, determining an accurate fit of the diff values to create a smooth curve.   
subplot(2,2,3);
diffx = diff(polyval(polyfit(pos(1,1:479),velocityposx(1,:),5),pos(1,1:479)));
plot(t(1,1:478),diffx);
title('Acceleration in the X-Direction vs Time');
xlabel('Time (seconds)');
ylabel('Acceleration (m/s/s)');

% Creating a smooth time vs. acceleration in the y-direction graph by
% using the 'diff' command to find the difference between the velocity values. 
% Afterwards, determining an accurate fit of the diff values to create a smooth curve. 
subplot(2,2,4);
diffy = diff(polyval(polyfit(pos(1,1:479),velocityposy(1,:),6),pos(1,1:479)));
plot(t(1,1:478),diffy);
title('Acceleration in the Y-Direction vs Time');
xlabel('Time (seconds)');
ylabel('Acceleration (m/s/s)');