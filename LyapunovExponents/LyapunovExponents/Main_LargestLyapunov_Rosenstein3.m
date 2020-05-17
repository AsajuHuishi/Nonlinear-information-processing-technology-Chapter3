% 计算混沌时间序列 Lyapunov 指数 - Lorenz 吸引子

clc
clear
close all

%-----------------------------------------------------------------
% 产生 Lorenz 混沌时间序列

sigma = 16;             % Lorenz 方程参数 a
b = 4;                  %                 b
r = 45.92;              %                 c            

y = [-1,0,1];           % 起始点 (1 x 3 的行向量)
h = 0.01;               % 积分时间步长

k1 = 30000;             % 前面的迭代点数
k2 = 6000;              % 后面的迭代点数

z = LorenzData(y,h,k1+k2,sigma,r,b);
x = z(k1+1:end,1);      % 时间序列

%-----------------------------------------------------------------
% Lorenz 入口参数

tau = 10;               % 时延
m = 3;                  % 嵌入维
taumax = 300;           % 最大离散步进时间
P = 100;                 % 序列平均周期
fs = 1/h;               % 采样频率

%-----------------------------------------------------------------

Y1 = Lyapunov_rosenstein_2(x,tau,m,taumax,P,fs);

figure
subplot(211); plot(Y1); grid; xlabel('i'); ylabel('y(i)'); title('Logistic')
subplot(212); plot(diff(Y1)); grid; xlabel('n'); ylabel('slope');

linear_zone = [50:200]';  % 线性区域
F1 = polyfit(linear_zone,Y1(linear_zone),1);

Lyapunov_2 = F1(1)                  % 以 2 为底的指数
Lyapunov_e = Lyapunov_2/1.4427      % 以 e 为底的指数

