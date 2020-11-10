%Main mfile to run everything / what we need%
clear;
clc;
close all;


gammadot = [0.0137, 0.0274, 0.0434, 0.0866, 0.137, 0.274, 0.434, 0.866, 1.37, 2.74, 4.34, 5.46, 6.88];
eta_i = [3220, 2190, 1640, 1050, 766, 490, 348, 223, 163, 104, 76.7, 68.1, 58.2];

%function we want to minimize - smallest value will be 0


mu = (1-sqrt(33))/8;
lambda = (1+sqrt(33))/8;
eps = 40; %our desired error
soln = 0;  %this is what we want the alg to go to

% Question 1a)
Y0a = [0 lambda 1 ;
       0 mu 1 ];
 
del_e_s = 2;            %_s stands for standard parameters
del_oc_s = 1/2;
del_ic_s = -1/2;
gamma_s = 1/2;

g = @(x) (100*(x(2) - (x(1))^2)^2 + (1 - x(1))^2) + (100*(x(3) - (x(2))^2)^2 + (1 - x(2))^2);

Y0a = [1 0 0 0;
       0 1 0 0;
       0 0 1 0];
[Yka, fkbesta, fevalsa] = nelderMead(Y0a, del_e_s, del_oc_s, del_ic_s, gamma_s, g, soln, eps);
[Ykb, fkbestb, fevalsb] = fortifiedNelderMead(Y0a, del_e_s, del_oc_s, del_ic_s, gamma_s, g, soln, eps);
convergencePlot2([fevalsa(:),fkbesta(:)+1], [fevalsb(:),fkbestb(:)+1], [fevalsb(:),fkbestb(:)+1], [fevalsb(:),fkbestb(:)+1],'C:\Users\sarah\Documents\School\Fifth Year\Math 462\Cosc419KGroupProject\testConvergenceFolder\',true)

function y = f(x)
y=0;
if x(1)<=0
    y= 360*x(1)^2+x(2)+x(2)^2;
else
    y=6*x(1)^2+x(2)+x(2)^2;
end
end