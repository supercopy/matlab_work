% 给出参数
fd = 10; % 例如，给出一个频偏
ts = 1/1000;
t = 0:ts:5; % 例如，从0到1秒，以0.01秒为间隔

% 运行 flat 函数
[h] = flat(fd, t);

% 生成正弦波信号
A = 1; % 正弦波的振幅
f = 1; % 正弦波的频率
sin_signal = A * sin(2*pi*f*t);

% 叠加信道系数影响
h_A = real(h); % h 的实部代表影响
h_B = imag(h); % h 的虚部代表影响

affected_signal_A = sin_signal .* h_A; % 叠加实部影响
affected_signal_B = sin_signal .* h_B; % 叠加虚部影响

% 观察信号变化
f = figure;
f.Position(1:2:3:4) = [10 100 1000 600];
subplot(3,1,1);
plot(t, sin_signal,'b');
axis([-0.1, 5.1,-1.1, 1.1]); %设定xy轴范围
title('原始正弦波信号');
grid on
subplot(3,1,2);
plot(t, affected_signal_A,'r');
axis([-0.1, 5.1,-2, 2]); %设定xy轴范围
title('叠加实部影响的信号');
grid on
subplot(3,1,3);
plot(t, affected_signal_B,'g');
axis([-0.1, 5.1,-2, 2]); %设定xy轴范围
title('叠加虚部影响的信号');
grid on