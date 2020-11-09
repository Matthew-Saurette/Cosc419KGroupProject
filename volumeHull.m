function [vol] = volumeHull(Yk)
for i = 2:length(Yk(1,:))
    L(:,i-1) = Yk(:,i)-Yk(:,1);
end
vol = abs(det(L))/factorial(length(L(1,:)));

end