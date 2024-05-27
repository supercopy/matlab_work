n = 3; %维度
x1 = randi([0, 10], n, n);
x2 = randi([0, 10], n, n);
[y1,y2] = test2(x1,x2,n);
fprintf('点乘结果中间元素:\t')
fprintf('%d\n', y1);
fprintf('叉乘结果中间元素:\t')
fprintf('%d\n', y2);
disp('x1:');
disp(x1);
disp('x2:')
disp(x2)