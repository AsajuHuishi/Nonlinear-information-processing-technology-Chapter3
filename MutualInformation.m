function MI = MutualInformation(Tau,N,Array,P)
% MI = MutualInformation(Tau,N,Array,P)
% Tau:延迟，N:序列长度，Array:频率分布序列,P网格数量
    %%% Initialization %%%
    MI = 0;
    NumberOfData = N - Tau + 1;
    Hi = zeros(P);
    Hj = zeros(P);
    Hij = zeros(P,P);
    
    %%% Calculate the number of each partition data %%%
    for I=Tau:N
        J=I-Tau+1;
        Hi(Array(I)) = Hi(Array(I)) + 1;
        Hj(Array(J)) = Hj(Array(J)) + 1;
        Hij(Array(I),Array(J)) = Hij(Array(I),Array(J)) + 1;
    end
    
    %%% Calculate the marginal probability distribution functions %%%
    Pi = Hi / NumberOfData;
    Pj = Hj / NumberOfData;
    
    %%% Calculate the joint probability distribution function %%%
    Pij = Hij / NumberOfData;
    
    %%% Caluculate the mutual information %%%
    for I=1:P
        for J=1:P
            if Pij(I,J)>0
                MI = MI + Pij(I,J) * log2(Pij(I,J)/(Pj(J)*Pi(I)));
            end
        end
    end
end






