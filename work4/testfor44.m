% 给出参数
fd = 10; % 给出一个频偏
ts = 1/100;
t = -30:ts:30; 

% 运行 flat 函数获取信道系数
[h] = flat(fd, t);

% 无虚假噪声的实部、虚部和包络
real_part = real(h);
imag_part = imag(h);
envelope = abs(h);

% 绘制信道系数实部、虚部和包络的取样分布直方图
f = figure;
f.Position(1:2:3:4) = [10 100 1000 600];
subplot(2, 2, 1);
histogram(real_part, 50);
title('信道系数实部取样分布');
grid on
subplot(2, 2, 2);
histogram(imag_part, 50);
title('信道系数虚部取样分布');
grid on
subplot(2, 2, 3);
histogram(envelope, 50);
title('信道系数包络取样分布');
grid on