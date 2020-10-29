%NELDER MEAD%
%FUNCTION Input:(Intial simplex, paramter values,obj function)
%OUTPUTS:
%Yk(matrix) at each iterate (stored in list)
%f(y0)=fkbest at at each iterate (store in list)
%number of function evals [function eval,f(yk)]
function [YkTotal, fkbest, feval_total] = nelderMead(Y0,del_e,del_oc,del_ic,gamma,f)

% Initialize the number of function evaluations and the storage vector for f
YkTotal(:,:,1) = Y0;
Yk = Y0;
iter = 1; %initialize counter of iterates so we can put stuff into lists
feval =0;
feval_total = []; %initialize  fevals 
f_store = [];
eps = 0.1; % Desired error
fkbest(1) = 20; %arbitrary value to start the while loop
solution = -5; % True solution vector
stepComputed = "shrink";
k = length(Y0(1,:)); %number of columns
% Insert a while loop here to encapsulate the rest of the algorithm
% for some stopping condition epsilon
%while (fkbest - solution) > eps
while iter < 5
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
    
    % NEW FUNCTION CREATED FOR SORT
    %if i==1
    %    Yk(:,:,i) = sort(Yk(:,:,i), 'ComparisonMethod', f(Yk(:,:,i)));
    %else
    %    Yk(:,:,i) = sort(Yk(:,:,i-1), 'ComparisonMethod', f(Yk(:,:,i-1)));
    %end
    %want to sort by value of f for each column, don't know if this is how it works...
    
    %     for i = 1:rank(Y0)
    %         for j = 1:rank(Y0)              if we can get the above to work, I think it's more efficient
    %             if f(Y0(j)) < f(Y0(i))
    %                 f(Yk(i)) = f(Yk(j));
    %             end
    %         end
    %     end
    
    
    

    
    
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
        disp("ref")
        Yk(:,k) = xr;
        f_store(k) = fr;
        stepComputed = "nonshrink";
        elseif (fr < f_store(1))  %EXPANSION%
    disp("exp")
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
                disp("oc")
                Yk(:,k) = xoc;
                f_store(k) = foc;
                stepComputed = "nonshrink";
            else 
                disp("ocref")
                Yk(:,k) = xr;
                f_store(k) = fr;
                stepComputed = "nonshrink" ;
            end
        elseif (fr >= f_store(k)) %INSIDE CONTRACTION + SHRINK%
            
            xic = xc + del_ic.*(xc - Yk(:,k));
            fic = f(xic);
            feval = feval + 1;
            if fic < f_store(k)
               disp("ic")
               Yk(:,k) = xic;
               f_store(k) = fic;
            stepComputed = "nonshrink";
            else
                disp("shrink")
                for i = 2:k
                    Yk(:,i) = (1+gamma).*Yk(:,1) + gamma.*Yk(:,i);
                    f_store(i) = f(Yk(:,i));
                    feval = feval + 1;
                end
                stepComputed = "shrink";
            end
        end
    disp("before sort")
    Yk
    [Yk, f_store] = sortSimplex(Yk, f_store,stepComputed);
    disp("after sort")
    Yk
    % Setting fkbest to f(y0)
    fkbest(iter) = f_store(1);
    YkTotal(:,:,iter) = Yk;
    feval_total(iter) = feval;
    
   
    
    
end
end
function [Yi,fYi] = sortSimplex(Yi,fYi,stepComputed)
k = length(Yi(1,:));
switch stepComputed
    case 'shrink'
        for i = 2:k
            key = Yi(i);
            fkey = fYi(i);
            j = i-1;
            while ((j>= 1) & (fkey < fYi(j)))
                Yi(j+1) = Yi(j);
                fYi(j+1) = fYi(j);
                j = j -1;
            end
            Yi(j+1) = key;
            fYi(j+1) = fkey;
        end
    case 'nonshrink'
        k = length(Yi(1,:));
        for i = k:-1:2
            if fYi(i)< fYi(i-1)
                temp = Yi(:,i-1);
                Yi(:,i-1) = Yi(:,i);
                Yi(:,i) = temp;
                
                
                tempf = fYi(i-1);
                fYi(i-1) = fYi(i);
                fYi(i) = tempf;
            else
                break;
            end
        end
end
   
end

