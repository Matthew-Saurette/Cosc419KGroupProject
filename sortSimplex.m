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
