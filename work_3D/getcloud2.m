% Load the stereoParameters object.
load('myframedata.mat');

% Visualize camera extrinsics.
showExtrinsics(stereoParams);

readerLeft = imread("C:\Users\13472\Desktop\机器人\forrobot2024work\pics\cornerl_1.png");
readerRight = imread("C:\Users\13472\Desktop\机器人\forrobot2024work\pics\cornerr_1.png");

frameLeft = readerLeft;
frameRight = readerRight;

[frameLeftRect, frameRightRect, reprojectionMatrix] = ...
    rectifyStereoImages(frameLeft, frameRight, stereoParams);

figure;
imshow(stereoAnaglyph(frameLeftRect, frameRightRect));
title('Rectified Video Frames');

frameLeftGray  = im2gray(frameLeftRect);
frameRightGray = im2gray(frameRightRect);

disparityRange = [0, 48];
disparityMap = disparitySGM(frameLeftGray, frameRightGray,"DisparityRange",disparityRange,"UniquenessThreshold",5);
figure;
imshow(disparityMap, disparityRange);
title('Disparity Map');
colormap jet;
colorbar;

points3D = reconstructScene(disparityMap, reprojectionMatrix);

% Convert to meters and create a pointCloud object
points3D = points3D ./ 1000;
ptCloud = pointCloud(points3D, 'Color', frameLeftRect);

% % Create a streaming point cloud viewer
% player3D = pcplayer([-3, 3], [-3, 3], [0, 8], 'VerticalAxis', 'y', ...
%     'VerticalAxisDir', 'down');

% Visualize the point cloud
% view(player3D, ptCloud.Location, ptCloud.Color);
pcshow(ptCloud);
