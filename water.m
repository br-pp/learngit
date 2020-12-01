%% 注水算法求解最优功率分配问题
clear,clc;
T = 10;
a = rand(T,1)
% a = [0.2691
%     0.7655
%     0.1887
%     0.2875
%     0.0911
%     0.5762
%     0.6834
%     0.5466
%     0.4257
%     0.6444]
%% 求解析解常数λ
% maxx = @(x)(x>0).*x;
syms lamda
f = @(lamda)(sum(((1/(log(2)*lamda)-1./a)>0).*(1/(log(2)*lamda)-1./a))-1);
lamda = fsolve(f,[0.5])
waterLine = 1/(log(2)*lamda)
p = zeros(T,1);
for i = 1:T
    p(i) = (1/(log(2)*lamda)-1/a(i)>0)*(1/(log(2)*lamda)-1/a(i));
end
p
%% 画图
x = [1];
y = [];
for i = 1:T
    y = [y,1/a(i),1/a(i)];
end
for i = 2:T
    x = [x,i,i];
end
x = [x,T+1];
%y = [0,y,0];

hold on;
plot(x,y,'-b');
xx = 0:0.1:T+2;
[~,len] = size(xx);
yy = waterLine.*ones(1,len);
plot(xx,yy,':b');
xlabel('i');
legend('a^-^1','注水线');
axis([1 T+1 -Inf Inf]);

set(gca,'xticklabel',[]);
set(gca,'xtick',[])
set(gca,'yticklabel',[]);
set(gca,'ytick',[])
text(1,waterLine,num2str(waterLine));