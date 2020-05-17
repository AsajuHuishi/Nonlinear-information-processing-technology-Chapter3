function C=correlation_integral_inf(Y,M,r)
C=0;
for i=1:M-1
    for j=i+1:M
        d1 = norm((Y(i,:)-Y(j,:)),inf);
        C = C + 1;
    end
end
C = 2*C/(M*(M-1));
end