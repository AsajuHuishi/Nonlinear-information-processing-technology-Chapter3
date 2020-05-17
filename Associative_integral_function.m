function C_xx = Associative_integral_function(X,epsilon)
%关联积分函数
% C_xx = Associative_integral_function(X,epsilon)
% X:相空间  epsilon:距离
N = size(X,2);
C_xx = 0;
for i = 1:N-1
    for j = i+1:N
        tmp = heaviside(epsilon-norm(X(i)-X(j)));
        C_xx = C_xx + tmp;
    end
end
C_xx = C_xx*2/(N*(N-1));
end