function [Smean,Sdeltmean,Scor,tau,tw] = C_C(X,max_d)
% max_d:最大时间延迟
    N = length(X);
    Smean = zeros(1,max_d);
    Scmean = zeros(1,max_d);
    Scor = zeros(1,max_d);
    delt = std(X);

    for t=1:max_d
        S = zeros(4,4);
        Sdelt = zeros(1,4);
        for m=2:5
            for j=1:4
                r = delt*j/2;
                Xdt = disjoint(X,N,t);
                Xdt = Xdt';
                s = 0;
                for tau =1:t
                    N_t = floor(N/t);
                    Y = Xdt(:,tau);
                    Z = reconstitution(Y,N_t,m,1);
                    Z = Z';
                    M = N_t-(m-1);
                    Cs(tau)=correlation_integral_inf(Z,M,r);
                    s = s+(Cs(tau)-Cs1(tau)^m);
                end
                S(m-1,j)=s/tau;
            end
            Sdelt(m-1)=max(S(m-1,:))-min(S(m-1,:));
        end
        Smean(t)=mean(mean(S));
        Sdeltmean(t)=mean(Sdelt);
        Scor(t)=abs(Smean(t))+Sdeltmean(t);
    end
    for i=2:length(Sdeltmean)-1
        if Sdeltmean(i)<Sdeltmean(i-1)&Sdeltmean(i)<Sdeltmean(i+1)
            tau=i;
            break;
        end
    end
    for i=length(Scor)
        if Scor(i)==min(Scor)
            tw=i;
            break;
        end
    end
end

