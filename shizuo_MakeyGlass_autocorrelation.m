tau = 30;
history = 0.5;
tapan = 1:1000;
sol = dde23(@Makey_Glass,tau,history,tapan);
t = sol.x;
data = sol.y;

[C, lags, bounds] = autocorr(data,size(data,2)-1);

C_0 = ACF(1);
plot(lags,C)
hold on
k1 = plot([1,size(lags,2)],[C_0/exp(1),C_0/exp(1)],'--');
hold on
k2 = plot([1,size(lags,2)],[0 0],'k--');
xlim([0 30]);
legend([k1 k2],'C(0)/e','0')
title('MakeyGlass采用自相关法曲线')
xlabel('\tau')
ylabel('C(\tau)')

