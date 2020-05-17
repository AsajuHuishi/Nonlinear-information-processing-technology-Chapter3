% Recurrence map Deu
% 20-3-18
clear all;clc
close('all')
x = 0.808;
a = 4;
np = 99;
data1 = logistik(x,a,np,0);
t1 = 1:100;
t2 = 101:1:300;
data2 = sin(0.03*pi*(t2-100));
xt = [t1 t2];
yt = [data1 data2];

three_xt = 1:3600;
three_yt = [yt yt yt yt yt yt yt yt yt yt yt yt];
figure;
plot(three_xt,three_yt)
title('合并时间序列（大周期）')
xlabel('n')
ylabel('x(n)')
xlim([0 3600])
% data = logistik(x,a,np,0);
m = 4; tau = 3;

re = draw_RQA(three_yt,m,tau);
figure;
imshow(re,'InitialMagnification','fit')
title('Logistic+Sin递归图')
xlabel('i')
ylabel('j')


