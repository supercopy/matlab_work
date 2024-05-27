f = figure('name','��Ŀ1','NumberTitle','off'); %�½�����
x = -2*pi:pi/40:2*pi; %����
y = sin(x);
z = cos(x);
subplot(211); %�趨��������Ϊһ
plot(x, y, 'b -. *',x, z, 'r - d'); %����
xlabel('ʱ�� t');
ylabel('��� y');
title('sin(x)/cos(x)');
axis([-5/2*pi, 5/2*pi,-1.5, 1.5]); %�趨xy�᷶Χ
text(6.5, 0,'sin(t)');
text(6.5, 1,'cos(t)');
grid on %��ʾ����
subplot(212)
stem(x, y, 'b -. *');
hold on;
stem(x, z, 'r - d');
xlabel('ʱ�� t');
ylabel('��� y');
title('sin(x)/cos(x)');
axis([-5/2*pi, 5/2*pi,-1.5, 1.5]);
text(6.5, 0,'sin(t)');
text(6.5, 1,'cos(t)');
grid on
