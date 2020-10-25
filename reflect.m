% Function Reflect - Child of NM
% Input:  Yk:     Current Simplex 
%         f:      Objective Function
%         fkbest: Current best solution
%
% Output: Yk:     (either with or without the addition of x_r
%         x_c:    our centroid  

function [Yk_next,x_c] = reflect(Yk,f,fkbest)

% Calculate the centroid
x_c = (1/rank(Yk))*sum(Yk(1:rank(Yk),:));

% Reflect across the centroid
x_r = x_c + (x_c - Yk(rank(Yk) + 1,:));

% Perform a function evaluation for reflection point
f_r = f(x_r);

% Conditional for accepting the reflection step, also insert the condition
% to check for possible expansion acceptance, if expansion step can be
% accepted then return, and the condition checking for equivalence will
% take place in NM, and afterwards we can proceed to the expansion step.

if fkbest <= f_r && f_r < f(Yk(rank(Yk,:)))
    if f_r < fkbest % Checks for expansion
    return;         
    end
    
    Yk_next = [Yk(1:rank(Yk),:), x_r];
    return;
end

end