function[y1, y2] = test2(x1,x2,n) %自定义函数
    reg1 = x1 .* x2;
    reg2 = x1 * x2;
    y1 = reg1((n+1)/2, (n+1)/2); %返回中心元素
    y2 = reg2((n+1)/2, (n+1)/2);
end