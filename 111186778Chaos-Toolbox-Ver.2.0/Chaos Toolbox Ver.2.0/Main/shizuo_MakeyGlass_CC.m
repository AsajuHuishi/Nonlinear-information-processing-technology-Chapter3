clear all;close('all')
tau = 30;
history = 0.5;
tapan = 1:500;
sol = dde23(@Makey_Glass,tau,history,tapan);
t = sol.x;
data = sol.y;
figure;
plot(t,data);
title('时间序列')
xlabel('t')
ylabel('x(t)')

X = data;
max_d = 8;
[Smean_inf,Sdeltmean_inf,Scor_inf] = C_CMethod(X);
% m = 3;
% N = size(data,2);
% sigma = std(data);
% rlist = [0.5*sigma,sigma,1.5*sigma,2.0*sigma];
% tauend = floor(sqrt(N/(m-1)));
% 
% tau = 1;
% delta_s_avg = 0;
% for m = 2:5
%     delta_s_avg = delta_s_avg + get_delta_S(data,m,rlist,tau);
% end
% delta_s_avg = delta_s_avg/4;
% % for tau = 1:tauend
%     delta_Slist(tau) = get_delta_S(data,m,rlist,tau);
% end

% function C = CorrelationFunction(data,m,N,r,tau)
% %计算整体相关性表达式 非线性信息处理技术[M].金宁德.92 pp.
% % C = CorrelationFunction(data,m,N,r,tau)
% X = reconstitution(data,N,m,tau);
% C = Associative_integral_function(X,r);
% end
% function S = CC(data,m,r,tau)
% % S = CC(data,m,r,t)
% S = 0;
% for s = 1:tau
%     tmpdata = data(s:tau:end);
%     disp(num2str(size(tmpdata,2)))
%     S = S + CorrelationFunction(tmpdata,m,size(tmpdata,2),r,tau) ...
%         -CorrelationFunction(tmpdata,1,size(tmpdata,2),r,tau);    
% end
% S = S/tau;
% end
% 
% function delta_S = get_delta_S(data,m,rlist,tau)
% % delta_S = get_delta_S(m,rlist,tau)
% len = size(rlist,2);
% slist = zeros(1,len);
% for i=1:len
%     slist(i) = CC(data,m,rlist(i),tau);
% end
% delta_S = max(slist)-min(slist);
% end