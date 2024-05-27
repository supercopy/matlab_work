% 生成随机三维点云数据
numPoints = 1000;
X = randn(numPoints, 1);
Y = randn(numPoints, 1);
Z = randn(numPoints, 1);

% 创建点云对象
ptCloud = pointCloud([X, Y, Z]);

% 创建3D点云显示窗口
figure;
pcshow(ptCloud);
xlabel('X');
ylabel('Y');
zlabel('Z');
title('随机生成的三维点云');