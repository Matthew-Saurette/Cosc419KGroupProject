function [diam] = diamHull(Yk)
max = -1;
for i = 1:length(Yk(1,:))
    for j = i:length(Yk(1,:))
        temp = norm(Yk(:,i)-Yk(:,j));
        if temp > max
            max = temp;
        end
    end
end
diam = max;
        
end