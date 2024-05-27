%输出[路径损耗，接收功率，接收功率W]
%输入[发射功率，发射增益，接受增益，频率/MHz，距离/km，自由空间度]
[PLdb,Rdbm,RW] = work22(0.1,3,0,2000,1,1);
A = [PLdb,Rdbm,RW];
fprintf('%f\n',PLdb);
fprintf('%1.12f\n',Rdbm);
fprintf('%1.15f\n',RW);
% 输入：1km，2 GHz，3dBi，0dBi，发射功率0.1瓦