% 计算混沌时间序列 Lyapunov 指数 - Henon 序列
% 计算 Henon 映射 x(n+1) = 1 - a * x(n)^2 + y(n); y(n+1) = b * x(n)

clc
clear
close all

%-----------------------------------------------------------------
% 产生 Henon 混沌时间序列

a = 1.4;
b = 0.3;

x0 = 0;
y0 = 0;

k1 = 10000;                % 前面迭代次数
k2 = 6000;                % 后面迭代次数
x = zeros(k1+k2,1);
for i = 1:k1+k2
    x1 = 1 - a * x0^2 + y0;
    y1 = b * x0;
    x0 = x1;
    y0 = y1;
    x(i) = x1;
end
x = x(k1+1:end);

%-----------------------------------------------------------------
% Henon 入口参数

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

