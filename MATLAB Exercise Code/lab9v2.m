domain_x = (-2:0.02:2); 
domain_y = (-2:0.02:2);

[X,Y] = meshgrid(domain_x,domain_y);
Z = X.*exp(-X.^2-Y.^2);

surf(X,Y,Z);
xlabel('x');ylabel('y');zlabel('g(x,y) = e^{-x^2-y^2}');
title('Behaviour of g(x,y) = e^{-x^2-y^2}');

figure;
plot(domain_x,Z(1,:),'b-');
hold on
plot(domain_x,Z(100,:));
hold on
plot(domain_y,Z(:,50));
xlabel('x and y');
ylabel('z');
legend('g(x,-2)','g(x,0)','g(-1,y)');
title('2D Plots');

[maxvalue,maxindex]=max(Z(:));
[ZmaxRow,ZmaxCol] = ind2sub(size(Z), maxindex);
% max of 0.4288 when (0.72,0.02)
% Calculation = (-2+0.02*136, -2+0.02*101)

[minvalue,minindex]=min(Z(:))
[ZminRow,ZminCol] = ind2sub(size(Z), minindex)
% min of -0.4288 when (-0.68,0.02)
% Calculation = (-2+0.01*66, -2+0.02*101)