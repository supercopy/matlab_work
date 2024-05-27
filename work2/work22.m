%计算自由空间路径损耗
%输出[路径损耗dB，接收功率dBm，接收功率W]
%输入[发射功率，发射增益，接受增益，频率/MHz，距离/km，自由空间度]
function[Pl,Pr,Prw] = work22(Pt,Gt,Gr,fc,d,L) %自定义函数,自由空间L = 1
        Pl = 32.44 + 20*log10(d) + 20*log10(fc) - Gr - Gt;
        Pr = 10*log10(Pt) - Pl + 30; %接收等于发射-损耗，转换单位为dBm
        Prw = 10^(Pr/10) / 1000; %反函数，转换单位为W
end
% 输入：1km，2GHz，3dBi，0dBi，发射功率0.1瓦，