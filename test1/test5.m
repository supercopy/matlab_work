n = 100;
a = 1;
b = 1000;
num = 1; %记录得到目标数目
A = []; %清空数组
B = [];
C = [];
while a <= b %默认步长为1
    if mod(a,n) == 0 %a对n求余
        A(1, :) = [a num]; %结果赋给行数为1的数组A
        B(num, :) = A(1, :); %num行数组B，存储结果
        num = num + 1;
    end
    a = a + 1;
end
data = fopen('data.dat', 'w'); %以写入权限打开文件data.dat
count = fwrite(data, B, 'int32'); %写入数组B
data = fopen('data.dat', 'r'); %以读出权限打开文件data.dat
[C, count] = fread(data,[num-1, 2], 'int32'); %取出数据至(num-1)*2维数组
closed = fclose(data); %关闭文件
fprintf('B:\n');
disp(B);
fprintf('C:\n');
disp(C);