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
f([9.48,8.36,8.71])  %this is what we want the alg to go to


% Question 1a)
Y0a = [0 1 0 0;
       0 0 1 0;
       0 0 0 1];
 
del_e_s = 2;            %_s stands for standard parameters
del_oc_s = 1/2;
del_ic_s = -1/2;
gamma_s = 0.1;
bestparam = {};
bestobj = 10000;
bestvals = [];
deleValues = 1.01:0.1:10;
tic 
parfor (del_ex = 1:numel(deleValues))
    del_e = deleValues(del_ex);
   
    bestvals(del_ex) = 10000;
    for del_oc = 0.01:0.01:0.99
        for del_ic = -0.99:0.01:0.01
            for gamma = 0.01:0.01:0.99
            [Yka, fkbesta, fevalsa] = nelderMead(Y0a, del_e, del_oc, del_ic, gamma, f, eps);
            if fkbesta(end) < bestvals(del_ex)
                bestparam{del_ex} = [del_e,del_oc,del_ic,gamma];
                bestvals(del_ex) = fkbesta(end);
            end
            end
        end
    end
end
best = bestvals(1);
bestparams = bestparam{1};
for i = 1:(length(bestvals))
    if  best > bestvals(i)
        best = bestvals(i);
        bestparams = bestparam{i};
    end
end
toc

disp(best)    
disp(bestparams)
