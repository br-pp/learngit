%% cvx 求解最优功率分配问题
clear,clc;
T = 10;
a = rand(T,1)
%% cvx 工具包
cvx_begin
    variable x(T);
    minimise (-sum(log2(1+a.*x)));
    subject to
        sum(x) == 1;
        x >= 0;
cvx_end
x