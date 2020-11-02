%NELDER MEAD%
%FUNCTION Input:(Intial simplex, paramter values,obj function)
%OUTPUTS:
%Yk(matrix) at each iterate (stored in list)
%f(y0)=fkbest at at each iterate (store in list)
%number of function evals [function eval,f(yk)]
function [YkTotal, fkbest, feval_total] = nelderMead(Y0,del_e,del_oc,del_ic,gamma,f, eps)

% Initialize the number of function evaluations and the storage vector for f
YkTotal(:,:,1) = Y0;
Yk = Y0;
iter = 1; %initialize counter of iterates so we can put stuff into lists
feval = 0;
feval_total = []; %initialize  fevals
f_store = [];
fkbest(1) = f(Y0(:,1)); %arbitrary value to start the while loop
solution = 0; % True solution vector
stepComputed = "shrink";
k = length(Y0(1,:)); %number of columns
% Insert a while loop here to encapsulate the rest of the algorithm
% for some stopping condition epsilon
%while (fkbest - solution) > eps
%while abs(fkbest(iter)-solution)>eps
<<<<<<< HEAD
while iter<100
=======
while iter<1000
>>>>>>> cb65b634b8e4f610c727ce7d5ae69797a842d956
    iter = iter+1;
    % This is 1. (Order) the above while loop will keep us within NM
    
    
    %ORDER THE initial simplex SIMPLEX
    if iter == 2
        for i = 1:k
            f_store(i) = f(Yk(:,i));
            feval = feval +1;
        end
        feval_total(iter-1) = feval;
        [Yk,f_store] = sortSimplex(Yk,f_store,stepComputed);
    end
    
    %CALCULATE CENTROID%
    xc = [0;0;0];
    for i = 1:k-1
        xc = xc + Yk(:,i);
    end
    xc = (1/k).*xc;
    
    %CALCULATE REFLECTION POINT%
    xr = xc + (xc - Yk(:,k));
    fr = f(xr);
    feval = feval + 1;
    
    %NM STEPS 2-5
    if (f_store(1) <= fr)&&(fr < f_store(k-1)) %REFLECTION STEP%
        %disp("ref")
        Yk(:,k) = xr;
        f_store(k) = fr;
        stepComputed = "nonshrink";
    elseif (fr < f_store(1))  %EXPANSION%
        %disp("exp")
        xe = xc + del_e*(xc - Yk(:,k));
        fe = f(xe);
        feval = feval + 1;
        if fe < fr
            Yk(:,k) = xe;
            f_store(k) = fe;
        else
            Yk(:,k) = xr;
            f_store(k) = fr;
        end
        stepComputed = "nonshrink";
    elseif (f_store(k-1) <= fr)&&(fr < f_store(k)) %OUTSIDE CONTRACTION%
        
        xoc = xc + del_oc*(xc - Yk(:,k));
        foc = f(xoc);
        feval = feval + 1;
        stepComputed = "nonshrink";
        if foc < fr
           % disp("oc")
            Yk(:,k) = xoc;
            f_store(k) = foc;
            stepComputed = "nonshrink";
        else
            %disp("ocref")
            Yk(:,k) = xr;
            f_store(k) = fr;
            stepComputed = "nonshrink" ;
        end
    elseif (fr >= f_store(k)) %INSIDE CONTRACTION + SHRINK%
        
        xic = xc + del_ic.*(xc - Yk(:,k));
        fic = f(xic);
        feval = feval + 1;
        if fic < f_store(k)
           % disp("ic")
            Yk(:,k) = xic;
            f_store(k) = fic;
            stepComputed = "nonshrink";
        else
           % disp("shrink")
            for i = 2:k
                Yk(:,i) = (1+gamma).*Yk(:,1) + gamma.*Yk(:,i);
                f_store(i) = f(Yk(:,i));
                feval = feval + 1;
            end
            [Yk,f_store] = sortSimplex(Yk,f_store,stepComputed);
            stepComputed = "shrink";
        end
    end
    %disp("before sort")
    %Yk
    [Yk, f_store] = sortSimplex(Yk, f_store,stepComputed);
    %disp("after sort")
    %Yk
    
    % Setting fkbest to f(y0)
    fkbest(iter) = f_store(1);
    YkTotal(:,:,iter) = Yk;
    feval_total(iter) = feval;
    
    %disp("fkbest")
    %fkbest(iter)
    %disp("values of f(Yk) across the columns")
    %disp([f_store(1), f_store(2), f_store(3), f_store(4)])
    %disp("fevals")
    %feval

end
end

