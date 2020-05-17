function [rex,rey,rez] = Runge_Kutta_for_Lorentz(x0,y0,z0,a,b,c,h,n)
%使用四阶龙格库塔法解Lorentz
% [rex,rey,rez] = Runge_Kutta_for_Lorentz(x0,y0,z0,a,b,c,h,n)
% h:步长,n:序列长度
x = x0;y = y0;z = z0;
rex = [x];
rey = [y];
rez = [z];
for i = 1:n
    k1 = fun1(x,y,z);
    l1 = fun2(x,y,z);
    p1 = fun3(x,y,z);

    k2 = fun1(x+h/2*k1,y+h/2*l1,z+h/2*p1);
    l2 = fun2(x+h/2*k1,y+h/2*l1,z+h/2*p1);
    p2 = fun3(x+h/2*k1,y+h/2*l1,z+h/2*p1);

    k3 = fun1(x+h/2*k2,y+h/2*l2,z+h/2*p2);
    l3 = fun2(x+h/2*k2,y+h/2*l2,z+h/2*p2);
    p3 = fun3(x+h/2*k2,y+h/2*l2,z+h/2*p2);

    k4 = fun1(x+h*k3,y+h*l3,z+h*p3);
    l4 = fun2(x+h*k3,y+h*l3,z+h*p3);
    p4 = fun3(x+h*k3,y+h*l3,z+h*p3);
    %iterate
    x = x + h/6*(k1+2*k2+2*k3+k4);
    y = y + h/6*(l1+2*l2+2*l3+l4);
    z = z + h/6*(p1+2*p2+2*p3+p4);
    rex = [rex x];
    rey = [rey y];
    rez = [rez z];
end

    function k = fun1(x,y,z)
        k = -a*x+a*y;
    end
    function l = fun2(x,y,z)
        l = -x*z+c*x-y;
    end
    function p = fun3(x,y,z)
        p = x*y - b*z;
    end
end
