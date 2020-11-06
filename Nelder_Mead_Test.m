% Begin with testing our Nelder Mead Method to see if it is properly approximating
% optimal values that we know it is capable of converging to

function tests = Nelder_Mead_Test
tests = functiontests(localfunctions);
end

% A trivial test case, where we test convergence on a convex function with
% the origin as the optimal solution.
function testConvex_atSolution(testCase)
f = @(x) x(1)^2+x(2)^2+x(3)^2;
Y0 = [1 0 0 0; 0 1 0 0; 0 0 1 0];
del_e = 2;            
del_oc = 1/2;
del_ic = -1/2;
gamma = 1/2;
eps = 1e-6;
fkbest_expected = (0);
[Yk_actual, fkbest_actual, fevals_actual] = nelderMead(Y0, del_e, del_oc, del_ic, gamma, f, fkbest_expected, eps);
verifyEqual(testCase, fkbest_actual(length(fkbest_actual)), fkbest_expected, 'AbsTol', eps); 
end

% A less nontrivial test case, where we test with vectors not assosciated
% with coordinate directions.
function testConvex(testCase)
f = @(x) x(1)^2+x(2)^2+x(3)^2;
Y0 = [10 10 356 423;
       10 346 9 56;
       2456 234565 34567 345];
del_e = 2;            
del_oc = 1/2;
del_ic = -1/2;
gamma = 1/2;
eps = 1e-6;
fkbest_expected = (0);
[Yk_actual, fkbest_actual, fevals_actual] = nelderMead(Y0, del_e, del_oc, del_ic, gamma, f, fkbest_expected,eps);
verifyEqual(testCase, fkbest_actual(length(fkbest_actual)), fkbest_expected, 'AbsTol', eps); 
end

% Less nontrivial test case, one where the origin is no longer the optimal
% solution, and shifted such that there are different vectors assosciated
% with the optimal solution.
function testConvex_solution_nonzero(testCase)
f = @(x) (x(1)-3)^2+(x(2)-3)^2+(x(3)-3)^2 + 10;
Y0 = [10 10 356 423;
       10 346 9 56;
       2456 234565 34567 345];
del_e = 2;            
del_oc = 1/2;
del_ic = -1/2;
gamma = 1/2;
eps = 1e-6;
fkbest_expected = (10);
[Yk_actual, fkbest_actual, fevals_actual] = nelderMead(Y0, del_e, del_oc, del_ic, gamma, f, fkbest_expected,eps);
verifyEqual(testCase, fkbest_actual(length(fkbest_actual)), fkbest_expected, 'AbsTol', eps); 
end

% A Nonconvex function with a global min and difficult valley to traverse
% is the Rosenbrock function

function testNonconvex_solution_min(testCase)

f = @(x) (100*(x(2) - (x(1))^2) + (1 - x(1))^2) + (100*(x(3) - (x(2))^2) + (1 - x(2))^2);

Y0 = [1 0 0 0;
       0 1 0 0;
       0 0 1 0];
del_e = 2;            
del_oc = 1/2;
del_ic = -1/2;
gamma = 1/2;
eps = 1e-6;
fkbest_expected = (0);
[Yk_actual, fkbest_actual, fevals_actual] = nelderMead(Y0, del_e, del_oc, del_ic, gamma, f, fkbest_expected,eps);
verifyEqual(testCase, fkbest_actual(length(fkbest_actual)), fkbest_expected, 'AbsTol', eps); 
end

% And lastly a nonconvex function that goes to -inf with arbitrary starting
% points.
function testNonconvex_solution_no_min(testCase)
f = @(x) x(1)*x(2) - x(2)*x(3) - x(3)*x(1);
Y0 = [10 10 356 423;
       10 346 9 56;
       2456 234565 34567 345];
del_e = 2;            
del_oc = 1/2;
del_ic = -1/2;
gamma = 1/2;
eps = 1e-6;
fkbest_expected = (-inf);
[Yk_actual, fkbest_actual, fevals_actual] = nelderMead(Y0, del_e, del_oc, del_ic, gamma, f, fkbest_expected,eps);
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


