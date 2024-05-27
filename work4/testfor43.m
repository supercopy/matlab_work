% 给出参数
fd = 10; % 例如，给出一个频偏
ts = 1/1000;
t = 0:ts:1; % 例如，从0到5秒，以0.001秒为间隔

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

% 添加AWGN
SNR = [0, 10, 20]; % 需要尝试的信噪比（SNR）

% 观察信号变化
f = figure;
f.Position(1:2:3:4) = [10 100 1000 600];
subplot(4,1,1);
plot(t, sin_signal,'b');
axis([-0.1, 1.1,-1.1, 1.1]); %设定xy轴范围
title('原始正弦波信号');
grid on

for i=1:length(SNR)
    awgn_signal_A = awgn(affected_signal_A, SNR(i));
    awgn_signal_B = awgn(affected_signal_B, SNR(i));
    
    subplot(4,1,1+i);
    plot(t, [awgn_signal_A; awgn_signal_B]);
    axis([-0.1, 1.1,-4, 4]); %设定xy轴范围
    title(['叠加影响且添加AWGN的信号 (SNR=', num2str(SNR(i)), 'dB)']);
    grid on
end
