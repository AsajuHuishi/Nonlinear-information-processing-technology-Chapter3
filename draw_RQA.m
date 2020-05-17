function re = draw_RQA(data, m, tau)

X = reconstitution(data,size(data,2),m,tau);

N = size(X,2);
epsilon = 0.3 * std(data);

re = zeros(N,N);
for i = 1:N
    for j = 1:N
        re(i,j) = Heavisido(epsilon - norm(X(i)-X(j)));
    end
end

re = rot90(re);
end