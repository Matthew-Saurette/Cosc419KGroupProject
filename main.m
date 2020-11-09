%Main mfile to run everything / what we need%
clear;
clc;
close all;


gammadot = [0.0137, 0.0274, 0.0434, 0.0866, 0.137, 0.274, 0.434, 0.866, 1.37, 2.74, 4.34, 5.46, 6.88];
eta_i = [3220, 2190, 1640, 1050, 766, 490, 348, 223, 163, 104, 76.7, 68.1, 58.2];

%function we want to minimize - smallest value will be 0
f = @(x) sum((abs(520*x(1)*(1+(14*x(2))^2.*(gammadot).^2).^(((0.038*x(3))-1)/2)-eta_i)).^1); 
eps = 40; %our desired error
soln = 0;
f([9.48,8.36,8.71]);  %this is what we want the alg to go to

% Question 1a)
Y0a = [0 1 0 0;
       0 0 1 0;
       0 0 0 1];
 
del_e_s = 2;            %_s stands for standard parameters
del_oc_s = 1/2;
del_ic_s = -1/2;
gamma_s = 1/2;


[Yka, fkbesta, fevalsa] = nelderMead(Y0a, del_e_s, del_oc_s, del_ic_s, gamma_s, f, soln, eps);
%simplexPlot.plotTotal(Yka,'C:\Users\User\Desktop\Math462\GroupProject\Cosc419KGroupProject\testSimplexPlotFolder\');

% Question 1b)
Y0b = Y0a + (9.5)*ones(3,4);   %translate Y0a by 9.5
%standard parameters as above
[Ykb, fkbestb, fevalsb] = nelderMead(Y0b, del_e_s, del_oc_s, del_ic_s, gamma_s, f, soln, eps);
%simplexPlot.plotTotal(Ykb,'C:\Users\User\Desktop\Math462\GroupProject\Cosc419KGroupProject\testSimplexPlotFolder\');

% Question 1c)

del_e_na = 2.81;            %_n stands for new parameters - these are the ones we propose
del_oc_na = 0.81;
del_ic_na = -0.39;
gamma_na = 0.1;

del_e_nb = 2.81;            %_n stands for new parameters - these are the ones we propose
del_oc_nb = 0.81;
del_ic_nb = -0.39;
gamma_nb = 0.1;

%a_n is part a w/ new parameters, b_n is part b w/ new parameters
[Yka_n, fkbesta_n, fevalsa_n] = nelderMead(Y0a, del_e_na, del_oc_na, del_ic_na, gamma_na, f, soln, eps);
[Ykb_n, fkbestb_n, fevalsb_n] = nelderMead(Y0b, del_e_nb, del_oc_nb, del_ic_nb, gamma_nb, f, soln, eps);


% Question 1d)
convergencePlot2([fevalsa(:),fkbesta(:)], [fevalsb(:),fkbestb(:)], [fevalsa_n(:),fkbesta_n(:)], [fevalsb_n(:),fkbestb_n(:)],'C:\Users\sarah\Documents\School\Fifth Year\Math 462\Cosc419KGroupProject\testConvergenceFolder\',true)

