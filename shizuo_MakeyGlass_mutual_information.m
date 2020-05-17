clear all;close('all')
tau = 30;
history = 0.5;
tapan = 1:1000;
sol = dde23(@Makey_Glass,tau,history,tapan);
t = sol.x;
data = sol.y;
figure;
plot(t,data);
title('时间序列')
xlabel('t')
ylabel('x(t)')

X = data;
N = length(X);
xMax = max(X);
xMin = min(X);
P = 32;
tauend=50;
%%% Normalization of time series data %%%
xNormalized = (X-xMin)/(xMax-xMin);

%%% Frequency distribution %%%
Array = ceil(xNormalized*P); %: Round toward positive infinity
Array(find(Array==0)) = 1; % If Array=0, Array=1
    
for Tau=1:tauend %N+1
    ResultMI(Tau,1) = MutualInformation(Tau,size(Array,2),Array,P);
end
DelayTime = [0:N]';
figure;
plot(DelayTime(1:tauend), ResultMI(1:tauend));
xlabel('\tau')
ylabel('Mutual Information I(\tau)')
title('MakeyGlass采用互信息法曲线')
ylim = get(gca,'Ylim');
re = ResultMI';
for i=2:size(re,2)-1
    if (re(i+1)>re(i))&&(re(i-1)>re(i))
        first_min_tau = i;
        return
    end
end
%%再次运行
hold on;

plot([first_min_tau,first_min_tau],ylim,'k--')

