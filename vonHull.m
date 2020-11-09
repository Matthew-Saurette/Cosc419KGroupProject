function [von] = vonHull(Yk)
von = volumeHull(Yk)/(diamHull(Yk)^(length(Yk(1,:))-1));
end