clear all;clc;close('all')
addpath('lyapunov_wolf\')
a=16; b=4; c=45.92;
h = 0.01; n = 20000-1;
[x0,y0,z0] = deal(10,1,0);
[x,y,z] = Runge_Kutta_for_Lorentz(x0,y0,z0,a,b,c,h,n);
figure;
plot3(x,y,z);
data = x(2001:8000);

m = 2;
tau = 2;
P = 2;
lambda_1=lyapunov_wolf(data,size(data,2),m,tau,P)
