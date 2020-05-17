clear all;clc;close('all')
t1 = 1:999;
x1 = 2*sin(0.5*t1)+1.5*cos(0.2*t1)+10;

t2 = 1000:1499;
x2 = exp(t2/3000)+2*sin(0.2*t2)-5;

t3 = 1500:2000;
x3 = tan(pi*t3)+2*sin(0.2*t3)+2;

t = [t1 t2 t3];
x = [x1 x2 x3];
M = size(x,2);

figure;
plot(t,x)
title('时间序列');
xlabel('t');
ylabel('x(t)')
% Thien Troc Pien Thac Dhiy
% i1 = 1000;i2 = 1500;i3 = 780;
n = 150;m = 3;tau = 4;
i = n+1:M-n-1;
M = [];
for it=i
    M_i1 = Dynamic_Segmentation_Algorithm(x,it,n,m,tau);
    M = [M M_i1];
%     disp([num2str(it),' ',num2str(M_i1)])
end

figure;
plot(i,M)
title('动力学差异测度');
xlabel('i')
ylabel('M(i)')
hold on
line([1000,1000],[0,100])
hold on
line([1500,1500],[0,100])
M_s = std(M,1);