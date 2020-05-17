function [rex,rey] = henon(x,y,a,b,np)
%Henon ”≥…‰
    rex = [x];
    rey = [y];
    for i = 1:np
        x_tmp = x;
        x = y - a*x^2+1;
        y = b*x_tmp;
        rex = [rex x];
        rey = [rey y];
    end
end

