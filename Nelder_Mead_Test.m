% Begin with testing our Nelder Mead Method to see if it is properly approximating
% optimal values that we know it is capable of converging to

function tests = Nelder_Mead_Test
tests = functiontests(localfunctions);
end

% A trivial test case, where we test convergence on a convex function with
% the origin as the optimal solution. We also let the first iteration be at
% the optimal solution, to test if Nelder Mead provides a proper output.
% ie) It outputs the optimal solution
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

% Now that we know that our Nelder Mead Method is capable of producing
% optimal outputs, we test on the same convex function without a trivial
% starting point.
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

% This is a less trivial test case, where we shift the optimal solution to
% demonstrate the Nelder Mead method is not simply converging to the
% origin.
function testConvex_solution_not_origin(testCase)
f = @(x) (x(1)-3)^2+(x(2)-3)^2 + 10;
Y0 = [10 10 356;
       10 346 9;];
del_e = 2;            
del_oc = 1/2;
del_ic = -1/2;
gamma = 1/2;
eps = 1e-6;
fkbest_expected = (10);
[Yk_actual, fkbest_actual, fevals_actual] = nelderMead(Y0, del_e, del_oc, del_ic, gamma, f, fkbest_expected,eps);
verifyEqual(testCase, fkbest_actual(length(fkbest_actual)), fkbest_expected, 'AbsTol', eps); 
end

% Now that we have tested the cases in the same dimension as our
% problem, we can test the Nelder Mead algorithm the flexibility of our
% Nelder Mead method in other dimensions. Below is a famous optimization
% problem called the Rastrigin problem.
function testRastrigin_2var(testCase)
f = @(x) 20 + (x(1)^2 - 10*cos(2*pi*x(1)) + (x(2)^2 - 10*cos(2*pi*x(2)))); 

Y0 = [-1.5 -3 1;
       1 3 1];
del_e = 2;            
del_oc = 1/2;
del_ic = -1/2;
gamma = 1/2;
eps = 1e-6;
fkbest_expected = (0);
[Yk_actual, fkbest_actual, fevals_actual] = nelderMead(Y0, del_e, del_oc, del_ic, gamma, f, fkbest_expected,eps);
verifyEqual(testCase, fkbest_actual(length(fkbest_actual)), fkbest_expected, 'AbsTol', eps);
end

function testRastrigin_10var(testCase)
f = @(x) 100 + (x(1)^2 - 10*cos(2*pi*x(1)) + (x(2)^2 - 10*cos(2*pi*x(2))) + x(3)^2 - 10*cos(2*pi*x(3)) + (x(4)^2 - 10*cos(2*pi*x(4))) + x(5)^2 - 10*cos(2*pi*x(5)) + (x(6)^2 - 10*cos(2*pi*x(6))) + x(7)^2 - 10*cos(2*pi*x(7)) + (x(8)^2 - 10*cos(2*pi*x(8))) + x(9)^2 - 10*cos(2*pi*x(9)) + (x(10)^2 - 10*cos(2*pi*x(10))) ); 
Y0 = [];
for i = 1:10
    Y0(i,:) = randperm(20,11);
end
del_e = 2;            
del_oc = 1/2;
del_ic = -1/2;
gamma = 1/2;
eps = 1e-6;
fkbest_expected = (0);
[Yk_actual, fkbest_actual, fevals_actual] = nelderMead(Y0, del_e, del_oc, del_ic, gamma, f, fkbest_expected,eps);
verifyEqual(testCase, fkbest_actual(length(fkbest_actual)), fkbest_expected, 'AbsTol', eps);
end

function testSchaffer2(testCase)
f = @(x) 0.5 + (sin(x(1)^2 - x(2)^2)^2 - 0.5)/(1 + 0.001*(x(1)^2 + x(2)^2))^2;

Y0 = [-100 100 1;
       10 50 1;
       ];
del_e = 2;            
del_oc = 1/2;
del_ic = -1/2;
gamma = 1/2;
eps = 1e-6;
fkbest_expected = (0);
[Yk_actual, fkbest_actual, fevals_actual] = nelderMead(Y0, del_e, del_oc, del_ic, gamma, f, fkbest_expected,eps);
verifyEqual(testCase, fkbest_actual(length(fkbest_actual)), fkbest_expected, 'AbsTol', eps);
end

% A Nonconvex function with a global min and difficult valley to traverse
% is the Rosenbrock function

function testRosenbrock(testCase)
f = @(x) (1-x(1))^2 + 100*(x(2)-x(1))^2;

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


