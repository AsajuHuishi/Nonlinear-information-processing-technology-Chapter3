% 计算混沌时间序列 Lyapunov 指数 - Logistic 序列

clc
clear
close all

%-----------------------------------------------------------------
% 产生 Logistic 混沌时间序列

lambda = 4;

k1 = 10000;             % 前面的迭代点数
k2 = 10000;             % 后面的迭代点数
x0 = rand(1);

x = zeros(k1+k2,1);
for i = 1:k1+k2
    x0 = lambda*x0*(1-x0);
    x(i) = x0;
end
x = x(k1+1:end);

%-----------------------------------------------------------------
% Logistic 入口参数

tau = 1;                % 时延
m = 2;                  % 嵌入维
taumax = 30;            % 最大离散步进时间
P = 100;                % 序列平均周期
fs = 1;                 % 采样频率

%-----------------------------------------------------------------

Y1 = Lyapunov_rosenstein_2(x,tau,m,taumax,P,fs);

figure
subplot(211); plot(Y1); grid; xlabel('i'); ylabel('y(i)'); title('Logistic')
subplot(212); plot(diff(Y1)); grid; xlabel('n'); ylabel('slope');

linear_zone = [1:7]';  % 线性区域
F1 = polyfit(linear_zone,Y1(linear_zone),1);

Lyapunov_2 = F1(1)                  % 以 2 为底的指数
Lyapunov_e = Lyapunov_2/1.4427      % 以 e 为底的指数



