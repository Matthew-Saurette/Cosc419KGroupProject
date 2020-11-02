clear; clc;

eps = 1e-6; %our desired error
f = @(x) x(1)^2+x(2)^2+x(3)^2;
Y0a = [10 10 356 423;
       10 346 9 56;
       2456 234565 34567 345];
   
del_e_s = 2;            %_s stands for standard parameters
del_oc_s = 1/2;
del_ic_s = -1/2;
gamma_s = 1/2;


[Yka, fkbesta, fevalsa] = nelderMead(Y0a, del_e_s, del_oc_s, del_ic_s, gamma_s, f, eps);
%simplexPlot.plotTotal(Yka,'C:\Users\User\Desktop\Math462\GroupProject\Cosc419KGroupProject\testSimplexPlotFolder\');


