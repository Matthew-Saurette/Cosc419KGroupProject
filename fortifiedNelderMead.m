%NELDER MEAD%
%FUNCTION Input:(Intial simplex, paramter values,obj function, actual solution, numerical error)
%OUTPUTS:
%Yk(matrix) at each iterate (stored in list)
%f(y0)=fkbest at at each iterate (store in list)
%number of function evals [function eval,f(yk)]
function [YkTotal, fkbest, feval_total] = fortifiedNelderMead(Y0,del_e,del_oc,del_ic,gamma,f, solution, eps)

sigma = @(x) (10^(-5))*min(x^2,1); 
beta = @(x) (10^(5))*x^2;
disp(vonHull(Y0));
v = vonHull(Y0)/2;
theta = 0.1;
% Initialize the number of function evaluations and the storage vector for f
YkTotal(:,:,1) = Y0;
Yk = Y0;
iter = 1; %initialize counter of iterates so we can put stuff into lists
feval = 0;
feval_total = []; %initialize  fevals
f_store = [];
fkbest(1) = f(Y0(:,1)); %arbitrary value to start the while loop
stepComputed = "fullSort";
k = length(Y0(1,:)); %number of columns
% Insert a while loop here to encapsulate the rest of the algorithm
% for some stopping condition epsilon

%while abs(fkbest(iter)-solution)>eps

while iter<50
    
    iter = iter+1;

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
    xc = zeros(k - 1,1);
    for i = 1:k-1
        xc = xc + Yk(:,i);
    end
    xc = (1/(k-1)).*xc;
    
    %CALCULATE REFLECTION POINT%
    xr = xc + (xc - Yk(:,k));
    fr = f(xr);
    feval = feval + 1;
    
    %Calculate Fbar%
    fbar =0;
    for i = 1:k-1
        fbar = fbar + f_store(i);
    end
    fbar = (1/(k-1)).*fbar;
    %check vol refstep
    Ykr = Yk;
    Ykr(:,k) = xr;
    zbar = 2.*Yk(:,1) - Yk(:,k);
    if (vonHull(Ykr) < v)
   
    fzbar = f(zbar);
    feval = feval + 1;
    if fzbar <= (f_store(1) - min(sigma(diamHull(Yk)),theta*(f_store(k)-f_store(1))-beta(diamHull(Yk))))
       % disp("rotation" + iter)
        Yk = 2.*Yk(:,1) - Yk;
        stepComputed = "fullSort";
        
    else
    for i = 2:k
        Yk(:,i) = (1-gamma).*Yk(:,1) + gamma.*Yk(:,i);
        f_store(i) = f(Yk(:,i));
        feval = feval + 1;
    end
    stepComputed = "fullSort";
    end
    else
    %NM STEPS 2-5
    if (f_store(1) <= fr)&&(fr < (f_store(k-1)-max(sigma(diamHull(Yk)),theta*(f_store(k)-fbar)-beta(diamHull(Yk))))) %REFLECTION STEP%
        %disp("ref")
        Yk(:,k) = xr;
        f_store(k) = fr;
        stepComputed = "partialSort";
    elseif (fr < f_store(1))  %EXPANSION%
        %disp("exp")
        xe = xc + del_e*(xc - Yk(:,k));
        fe = f(xe);
        feval = feval + 1;
        Yke = Yk;
        Yke(:,k) = xe;
        if (fe < fr ) && (vonHull(Yke) >=v)
            Yk(:,k) = xe;
            f_store(k) = fe;
        else
            Yk(:,k) = xr;
            f_store(k) = fr;
        end
        stepComputed = "partialSort";
    elseif (f_store(k-1) <= fr)&&(fr < f_store(k)) %OUTSIDE CONTRACTION%
        
        xoc = xc + del_oc*(xc - Yk(:,k));
        foc = f(xoc);
        feval = feval + 1;
        stepComputed = "partialSort";
        Ykoc = Yk;
        Ykoc(:,k) = xoc;
        if (foc < (fr - sigma(diamHull(Yk)))) && (vonHull(Ykoc) >= v)
           % disp("oc")
            Yk(:,k) = xoc;
            f_store(k) = foc;
            stepComputed = "partialSort";
        else
            %disp("ocref")
            Yk(:,k) = xr;
            f_store(k) = fr;
            stepComputed = "partialSort" ;
        end
    elseif (fr >= f_store(k))  %INSIDE CONTRACTION + SHRINK% 
        xic = xc + del_ic.*(xc - Yk(:,k));
        fic = f(xic);
        feval = feval + 1;
        Ykic = Yk;
        Ykic(:,k) = xic;
        if (fic < (f_store(k)- sigma(diamHull(Yk)))) && (vonHull(Ykic) >= v)
           % disp("ic")
            Yk(:,k) = xic;
            f_store(k) = fic;
            stepComputed = "partialSort";
        else
           % disp("shrink")
            for i = 2:k
                Yk(:,i) = (1-gamma).*Yk(:,1) + gamma.*Yk(:,i);
                f_store(i) = f(Yk(:,i));
                feval = feval + 1;
            end
            stepComputed = "fullSort";
        end
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
%fkbest(iter)
%Yk
end






