function X=reconstitution(data,N,m,tau)
%重构相空间
% X=reconstitution(data,N,m,tau)
% data为输入时间序列，N为时间序列长度，m为嵌入空间维数，tau为时间延迟，
% X为输出,是m*n维矩阵
M=N-(m-1)*tau;%相空间中点的个数
if M<0
    error('M<0!')
end
for j=1:M %相空间重构
    for i=1:m
        X(i,j)=data((i-1)*tau+j);
    end
end