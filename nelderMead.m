%NELDER MEAD%
%FUNCTION Input:(Intial simplex, paramter values,obj function, actual solution, numerical error)
%OUTPUTS:
%Yk(matrix) at each iterate (stored in list)
%f(y0)=fkbest at at each iterate (store in list)
%number of function evals [function eval,f(yk)]
function [total_Simplecies, best_Function_val, feval_total] = nelderMead(Y0,del_e,del_oc,del_ic,gamma,f, solution, eps)

% Initialize the number of function evaluations and the storage vector for f
total_Simplecies(:,:,1) = Y0;
current_Simplex = Y0;
iteration = 1; %initialize counter of iterates so we can put stuff into lists
feval = 0;
feval_total = []; %initialize  fevals
function_at_simplex = [];
best_Function_val(1) = f(Y0(:,1)); %arbitrary value to start the while loop
stepComputed = "fullSort";
k = length(Y0(1,:)); %number of columns


while ((abs(best_Function_val(iteration)-solution)>eps) &&(iteration<100))

    
    iteration = iteration+1;

    %ORDER THE initial simplex SIMPLEX
    if iteration == 2
        for i = 1:k
            function_at_simplex(i) = f(current_Simplex(:,i));
            feval = feval +1;
        end
        feval_total(iteration-1) = feval;
        [current_Simplex,function_at_simplex] = sortSimplex(current_Simplex,function_at_simplex,stepComputed);
    end
    
    %CALCULATE CENTROID%
    xc = zeros(k - 1,1);
    for i = 1:k-1
        xc = xc + current_Simplex(:,i);
    end
    xc = (1/(k-1)).*xc;
    
    %CALCULATE REFLECTION POINT%
    xr = xc + (xc - current_Simplex(:,k));
    fr = f(xr);
    feval = feval + 1;
    
    %NM STEPS 2-5
    %REFLECTION STEP%
    if (function_at_simplex(1) <= fr)&&(fr < function_at_simplex(k-1)) 
        current_Simplex(:,k) = xr;
        function_at_simplex(k) = fr;
        stepComputed = "partialSort";
        
    %EXPANSION%    
    elseif (fr < function_at_simplex(1))  
        xe = xc + del_e*(xc - current_Simplex(:,k));
        fe = f(xe);
        feval = feval + 1;
        if fe < fr
            current_Simplex(:,k) = xe;
            function_at_simplex(k) = fe;
        else
            current_Simplex(:,k) = xr;
            function_at_simplex(k) = fr;
        end
        stepComputed = "partialSort";
        
    %OUTSIDE CONTRACTION%    
    elseif (function_at_simplex(k-1) <= fr)&&(fr < function_at_simplex(k))  
        xoc = xc + del_oc*(xc - current_Simplex(:,k));
        foc = f(xoc);
        feval = feval + 1;
        stepComputed = "partialSort";
        if foc < fr
            current_Simplex(:,k) = xoc;
            function_at_simplex(k) = foc;
            stepComputed = "partialSort";
        else
            current_Simplex(:,k) = xr;
            function_at_simplex(k) = fr;
            stepComputed = "partialSort" ;
        end
    
    %INSIDE CONTRACTION + SHRINK%      
    elseif (fr >= function_at_simplex(k))  
        xic = xc + del_ic.*(xc - current_Simplex(:,k));
        fic = f(xic);
        feval = feval + 1;
        if fic < function_at_simplex(k)
            current_Simplex(:,k) = xic;
            function_at_simplex(k) = fic;
            stepComputed = "partialSort";
        else
            for i = 2:k
                current_Simplex(:,i) = (1-gamma).*current_Simplex(:,1) + gamma.*current_Simplex(:,i);
                function_at_simplex(i) = f(current_Simplex(:,i));
                feval = feval + 1;
            end
            stepComputed = "fullSort";
        end
    end
  
    [current_Simplex, function_at_simplex] = sortSimplex(current_Simplex, function_at_simplex,stepComputed);
  
    
    % Setting best_Function_val to f(y0)
    best_Function_val(iteration) = function_at_simplex(1);
    total_Simplecies(:,:,iteration) = current_Simplex;
    feval_total(iteration) = feval;
    

end
end

