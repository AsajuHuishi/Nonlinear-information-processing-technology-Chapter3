function [re] = logistik(x,a,np,noise)
%LOGISTIK ”≥…‰
    re = [x];
    for i = 1:np
        x = a*x*(1-x)+noise*wgn(1,1,0);
        re = [re x];
    end
end

