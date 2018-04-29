function [verticalSeam] = find_vertical_seam(cumulativeEnergyMap)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

[m,n] = size(cumulativeEnergyMap);
verticalSeam = zeros(1,m)
[M,I] = min(cumulativeEnergyMap(m,:));
verticalSeam(m) = I;

for i = m-1:-1:1
    if (I == 1)
        [M,I] = min(cumulativeEnergyMap(i,I), cumulativeEnergyMap(i, I+1));
    elseif (I == n)
        [M,I] = min(cumulativeEnergyMap(i,I), cumulativEnergyMap(i, I-1));
    else
        [M,I] = min(cumulativeEnergyMap(i,I-1), cumulativEnergyMap(i, I), cumulativEnergyMap(i, I+1));
    end
    verticalSeam(i) = I;
end
end

