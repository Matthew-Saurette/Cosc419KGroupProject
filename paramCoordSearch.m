%Main mfile to run everything / what we need%
clear;
clc;
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
f([9.48,8.36,8.71]);  %this is what we want the alg to go to


% Question 1a)
Y0a = [0 1 0 0;
       0 0 1 0;
       0 0 0 1];
 
del_e_s = 4.71;            %_s stands for standard parameters
del_oc_s = 0.65;
del_ic_s = -0.3;
gamma_s = 0.94;
eps = 0.0000000001;
del = 0.5;
bestparam = [del_e_s;del_oc_s;del_ic_s;gamma_s];
[Yka, fkbesta, fevalsa] = nelderMead(Y0a, bestparam(1), bestparam(2), bestparam(3), bestparam(4), f, 1, 1);
bestf = fkbesta(end);
bestobj = 10000;
bestvals = [];
deleValues = 4.70:0.001:4.72;
improved = false;
tic 
while del > eps
    P=[];
    I = eye(4);
    for i = 1:4
    P = [P,bestparam + del.*I(:,i),bestparam - del.*I(:,i)];
    end
    for i = 1:length(P)
        [Yka, fkbesta, fevalsa] = nelderMead(Y0a, P(1,i), P(2,i), P(3,i), P(4,i), f, 1, 1);
        tempf = fkbesta(end);
        if tempf  < bestf
            bestf = tempf ;
            bestparam = P(:,i);
            improved = true;
            break
        end
    end
    if improved == false
            del = 0.95*del;
    end
    improved = false;
end
toc

disp(bestparam)
