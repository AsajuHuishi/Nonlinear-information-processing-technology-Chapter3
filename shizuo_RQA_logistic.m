% Recurrence map Deu
% 20-3-18
close('all')
x = 0.808;
a = 4;
np = 199;
data = logistik(x,a,np,0);
figure;
plot(data);
title('时间序列')
xlabel('n')
ylabel('x(n)')
% data = logistik(x,a,np,0);
m = 1;
X = reconstitution(data,size(data,2),m,1);

N = size(X,2);
epsilon = 0.25 * std(data);

re = zeros(N,N);
for i = 1:N
    for j = 1:N
        re(i,j) = Heavisido(epsilon - norm(X(i)-X(j)));
    end
end

re = rot90(re);
figure;
imshow(re)
title('Logistic无噪声递归图')
xlabel('i')
ylabel('j')


