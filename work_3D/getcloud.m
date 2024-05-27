run("E:\matlab_work\work_3D\for2024_5_26again.m");

% 读取左右彩色图像
I1_C3 = imread("C:\Users\13472\Desktop\机器人\pics\cornerl_1.png");
I2_C3 = imread("C:\Users\13472\Desktop\机器人\pics\cornerr_1.png");

% 矫正左右彩色图像，利用导入的立体相机参数
[J1_C3, J2_C3] = rectifyStereoImages(I1_C3, I2_C3, stereoParams);

% 利用矫正后的左右图生成立体图像
Anaglyph = stereoAnaglyph(J1_C3, J2_C3);
figure; imshow(Anaglyph);

% 使用 imtool 确定视差范围值（max=93.5），这里取 128，（具体操作见说明）
figure; imageViewer(Anaglyph);
disparityRange = [0, 64];

% 利用矫正后的灰度图生成视差图
J1_C1 = rgb2gray(J1_C3);
J2_C1 = rgb2gray(J2_C3);

% % Minimum value of uniqueness = 15
% disparityMap_t15 = disparitySGM(J1_C1, J2_C1, 'DisparityRange', disparityRange, 'UniquenessThreshold', 15);
% figure; imshow(disparityMap_t15, disparityRange); title('disp t15'); colormap jet; colorbar;

% Minimum value of uniqueness = 10
disparityMap_t10 = disparitySGM(J1_C1, J2_C1, 'DisparityRange', disparityRange, 'UniquenessThreshold', 10);
figure; imshow(disparityMap_t10, disparityRange); title('disp t10'); colormap jet; colorbar;

% % Minimum value of uniqueness = 5
% disparityMap_t5 = disparitySGM(J1_C1, J2_C1, 'DisparityRange', disparityRange, 'UniquenessThreshold', 5);
% figure; imshow(disparityMap_t5, disparityRange); title('disp t5'); colormap jet; colorbar;
% 
% % Minimum value of uniqueness = 0
% disparityMap_t0 = disparitySGM(J1_C1, J2_C1, 'DisparityRange', disparityRange, 'UniquenessThreshold', 0);
% figure; imshow(disparityMap_t0, disparityRange); title('disp t0'); colormap jet; colorbar;

% 利用视差图重建 3D 图
points3D = reconstructScene(disparityMap_t10, stereoParams);

% 将距离单位由 mm -> m
points3D = points3D ./ 500;

% 存储 3D 图的点云数据
ptCloud = pointCloud(points3D, 'Color', J1_C3);

% 使用 pcplayer 观察点云图
player3D = pcplayer([-3, 3], [-3, 3], [0, 8], 'VerticalAxis', 'Y', 'VerticalAxisDir', 'Up');
view(player3D, ptCloud);
