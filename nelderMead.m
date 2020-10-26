%NELDER MEAD%
%FUNCTION Input:(Intial simplex, paramter values,obj function)
%OUTPUTS
%Yk(matrix) at each itterate (stored in list)
%f(y0) at at each itterate (store in list)
%number of function evals [function eval,f(yk)]
function [Yk, f, fevals] = nelderMead(Y0,del_e,del_oc,del_ic,gamma,f)

% First step is to order Y0 into Yk, and to initialize the number of
% function evaluations and the storage vector for f
Yk = [];
fevals = 0;
f_store = [];
eps; % Desired error
solution; % True solution vector

% Insert another a while loop here to encapsulate the rest of the algorithm
% for some stopping condition epsilon
while (norm(Yk) - solution) > eps
    % This is 1. the above while loop will keep us within NM
    for i = 1:rank(Y0)
        for j = 1:rank(Y0)
            if f(Y0(j)) < f(Y0(i))
                f(Yk(i)) = f(Yk(j));
            end
        end
    end
    % Setting fkbest to f(y0)
    fkbest = f(Yk(1));
    
    % Begin Reflection step
    [Yk_next, x_c] = reflect(Yk,f,fkbest);
    
    % If Yk changed, then the reflection step was accepted, and therefore
    % we must go back to 1.
    if Yk_next ~= Yk % I am pretty sure this works in Matlab
        continue;
    end
    
end
end
    