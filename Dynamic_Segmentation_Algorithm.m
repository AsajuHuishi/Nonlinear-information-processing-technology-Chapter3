function M_i = Dynamic_Segmentation_Algorithm(x,i,n,m,tau)
%动力学分割算法
% M_i = Dynamic_Segmentation_Algorithm(x,i,n,m,tau)
% x:时间序列 i1:参考点 n:分割长度
% m:嵌入维数 tau:延迟
% n = 50;
L_i = x(i-n+1:i);%左窗口
R_i = x(i:i+n-1);%右窗口
% epsilon;
%% 相空间重构
XL_i = reconstitution(L_i,n,m,tau);%3-107
XR_i = reconstitution(R_i,n,m,tau);
%% 计算关联积分函数
C_L = Associative_integral_function(XL_i,0.25*std(L_i));%3-108
C_R = Associative_integral_function(XR_i,0.25*std(R_i));
%% 分割参考窗口
N = size(x,2);
W = [];%每一行是一个w,一共k列,即k*n矩阵
for k = 0:N/n-1
    W = [W;x(k*n+1:(k+1)*n)];
end
%% 左右窗口和参考窗口的动力学差异
for col = 1:k+1
    XW_col = reconstitution(W(col,:),n,m,tau);
    C_w_col = Associative_integral_function(XW_col,0.25*std(W(col,:)));%参考窗口的C
    D_Lw(col) = abs(log(C_L/C_w_col));%3-109
    D_Rw(col) = abs(log(C_R/C_w_col));
% disp(['col=',num2str(col),' is over'])
end
D_Li = mean(D_Lw);
D_Ri = mean(D_Rw);
S_Li = std(L_i);
S_Ri = std(R_i);
S_Di = 1/n*sqrt(S_Li^2+S_Ri^2);
lamda = 3;
M_i = lamda*abs((D_Li-D_Ri)/S_Di);%3-110
end