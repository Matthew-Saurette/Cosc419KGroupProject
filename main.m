%Main mfile to run everything / what we need%
clear;
clc;
close all;
% Y# refers to simplex, y# refers to point in given simplex 

eps = 10; %our desired error

gammadot = [0.0137, 0.0274, 0.0434, 0.0866, 0.137, 0.274, 0.434, 0.866, 1.37, 2.74, 4.34, 5.46, 6.88];
eta_i = [3220, 2190, 1640, 1050, 766, 490, 348, 223, 163, 104, 76.7, 68.1, 58.2];
syms eta lambda beta;
%function we want to minimize - smallest value will be 0
% Needs to be rewritten, can't use symsum with index calls apparently :(
% Matt - Use sum, revert to vector, dot product, cross product, take the
% difference, flux integrals...
%f(eta, lambda, beta) = symsum(abs(eta*(1+lambda^2*(gammadot(1j))^2)^((beta-1)/2)-eta_i(1j)), 1j, [1 13]); 

f = @(x) sum((abs(520*x(1)*(1+(14*x(2))^2.*(gammadot).^2).^(((0.038*x(3))-1)/2)-eta_i)).^1); 
f([9.48,8.36,8.71])  %this is what we want the alg to go to


% Question 1a)
Y0a = [0 1 0 0;
       0 0 1 0;
       0 0 0 1];
 
del_e_s = 2;            %_s stands for standard parameters
del_oc_s = 1/2;
del_ic_s = -1/2;
gamma_s = 0.1;


[Yka, fkbesta, fevalsa] = nelderMead(Y0a, del_e_s, del_oc_s, del_ic_s, gamma_s, f, eps);
%simplexPlot.plotTotal(Yka,'C:\Users\User\Desktop\Math462\GroupProject\Cosc419KGroupProject\testSimplexPlotFolder\');

% Question 1b)
Y0b = Y0a + (9.5)*ones(3,4);   %translate Y0a by 9.5
%standard parameters as above
[Ykb, fkbestb, fevalsb] = nelderMead(Y0b, del_e_s, del_oc_s, del_ic_s, gamma_s, f, eps);
%simplexPlot.plotTotal(Ykb,'C:\Users\User\Desktop\Math462\GroupProject\Cosc419KGroupProject\testSimplexPlotFolder\');

% Question 1c)
del_e_n = 2000;            %_n stands for new parameters - these are the ones we propose
del_oc_n = 1/8;
del_ic_n = -3/4;
gamma_n = 1/6;

%a_n is part a w/ new parameters, b_n is part b w/ new parameters
[Yka_n, fkbesta_n, fevalsa_n] = nelderMead(Y0a, del_e_n, del_oc_n, del_ic_n, gamma_n, f, eps);
[Ykb_n, fkbestb_n, fevalsb_n] = nelderMead(Y0b, del_e_n, del_oc_n, del_ic_n, gamma_n, f, eps);
% Question 1d)

%convergence plots go here
convergencePlot2([fevalsa(:),fkbesta(:)], [fevalsb(:),fkbestb(:)], [fevalsa_n(:),fkbesta_n(:)], [fevalsb_n(:),fkbestb_n(:)],'C:\Users\sarah\Documents\School\Fifth Year\Math 462\Cosc419KGroupProject\testConvergenceFolder',true)

