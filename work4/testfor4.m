clear all
fd1 = 10;
ts = 1/1000;
t = 0:ts:1;
h1 = flat(fd1, t);

fd2 = 20;
h2 = flat(fd2, t);

subplot(211),plot(20*log10(abs(h1(1:1000))))
title('fd = 10Hz')
xlabel('时间');
ylabel('功率');
subplot(212),plot(20*log10(abs(h2(1:1000))))
title('fd = 20Hz');
xlabel('时间');
ylabel('功率');
grid on