% Recurrence map henon
% 20-3-18
close('all')
x = 0; y = 0;
a = 1.4; b = 0.3;
np = 249;
[data,~] = henon(x,y,a,b,np);
plot(data);
title('Henon ±º‰–Ú¡–')
xlabel('n')
ylabel('x(n)')

m = 1;
X = reconstitution(data,size(data,2),m,1);

N = size(X,2);
epsilon = 0.2 * std(data);

re = zeros(N,N);
for i = 1:N
    for j = 1:N
        re(i,j) = Heavisido(epsilon - norm(X(i)-X(j)));
    end
end

re = rot90(re);
figure;
imshow(re)
title('Henonµ›πÈÕº')
xlabel('i')
ylabel('j')