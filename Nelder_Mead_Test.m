% Begin with testing our Nelder Mead Method is properly approximating
% converging to optimal values that we know it is capable of converging to

function tests = Nelder_Mead_Test
tests = functiontests(localfunctions);
end

function testConvex_atSolution(testCase)
f = @(x) x(1)^2+x(2)^2+x(3)^2;
Y0 = [1 0 0 0; 0 1 0 0; 0 0 1 0];
del_e = 2;            
del_oc = 1/2;
del_ic = -1/2;
gamma = 1/2;
eps = 1e-6;
[Yk_actual, fkbest_actual, fevals_actual] = nelderMead(Y0, del_e, del_oc, del_ic, gamma, f, eps);
fkbest_expected = (0);
verifyEqual(testCase, fkbest_actual(length(fkbest_actual)), fkbest_expected, 'AbsTol', eps); 
end
%f = @(x) x(1)^2+x(2)^2+x(3)^2;
%Y0a = [10 10 356 423;
%       10 346 9 56;
%       2456 234565 34567 345];
   
%del_e_s = 2;            %_s stands for standard parameters
%del_oc_s = 1/2;
%del_ic_s = -1/2;
%gamma_s = 1/2;


%[Yka, fkbesta, fevalsa] = nelderMead(Y0a, del_e_s, del_oc_s, del_ic_s, gamma_s, f, eps);
%simplexPlot.plotTotal(Yka,'C:\Users\User\Desktop\Math462\GroupProject\Cosc419KGroupProject\testSimplexPlotFolder\');


