clear all
domain_x=[-3:0.01:3];
domain_y=[-3:0.01:3];

[X,Y] = meshgrid(domain_x,domain_y);
Z = Y.^2-X.^2;
mesh(X,Y,Z);
xlabel('x');ylabel('y');zlabel('z');
