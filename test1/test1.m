f = figure('name','题目1','NumberTitle','off'); %新建窗口
x = -2*pi:pi/40:2*pi; %采样
y = sin(x);
z = cos(x);
subplot(211); %设定绘制区域为一
plot(x, y, 'b -. *',x, z, 'r - d'); %连续
xlabel('时间 t');
ylabel('振幅 y');
title('sin(x)/cos(x)');
axis([-5/2*pi, 5/2*pi,-1.5, 1.5]); %设定xy轴范围
text(6.5, 0,'sin(t)');
text(6.5, 1,'cos(t)');
grid on %显示网格
subplot(212)
stem(x, y, 'b -. *');
hold on;
stem(x, z, 'r - d');
xlabel('时间 t');
ylabel('振幅 y');
title('sin(x)/cos(x)');
axis([-5/2*pi, 5/2*pi,-1.5, 1.5]);
text(6.5, 0,'sin(t)');
text(6.5, 1,'cos(t)');
grid on
