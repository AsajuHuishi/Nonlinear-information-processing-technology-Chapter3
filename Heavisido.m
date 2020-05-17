function [re] = Heavisido(inn)
%HEAVISIDE 
%
if inn <0
    re = 1;
elseif inn>0
    re = 0;
else
    re = 0.5;
end

