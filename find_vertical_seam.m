function [verticalSeam] = find_vertical_seam(cumulativeEnergyMap)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
[m,n] = size(cumulativeEnergyMap);
verticalSeam = zeros(1,m);

[~, min_idx] = min(cumulativeEnergyMap(m,:));
verticalSeam(m) = min_idx;

for x = m-1:-1:1
    if (min_idx == 1)
        [~,min_idx] = min([cumulativeEnergyMap(x,min_idx), cumulativeEnergyMap(x, min_idx+1)]);
    elseif (min_idx == n)
        [~,min_idx] = min([cumulativeEnergyMap(x,min_idx), cumulativeEnergyMap(x, min_idx-1)]);
    else
        [~,min_idx] = min([cumulativeEnergyMap(x,min_idx-1), cumulativeEnergyMap(x, min_idx), cumulativeEnergyMap(x, min_idx+1)]);
    end
    verticalSeam(x) = min_idx;
end
end
