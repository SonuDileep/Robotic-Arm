%ECE 455-Project-2

input1 = fopen('arm');
n = fscanf(input1, '%d', 1); 
lambda = fscanf(input1, '%f', 1);
fclose(input1);
M = dlmread('arm','',1,0); 
l = M(:,1);
theta = M(:,2);
theta = transpose(theta);


input2 = fopen('trajectory');
m = fscanf(input2, '%d', 1); 
lambda = fscanf(input2, '%f', 1);
fclose(input2);
M = dlmread('trajectory','',1,0); 
xd = M(:,1);
yd = M(:,2);

angles=DLS(n,m,lambda,l,theta,xd, yd);
dlmwrite('angles',angles, ' ');