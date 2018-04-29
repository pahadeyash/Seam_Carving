function horizontalSeam = find_horizontal_seam(cumulativeEnergyMap)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[m,n] = size(cumulativeEnergyMap);

horizontalSeam = cumulativeEnergyMap(0, :);

% finding minimum in last column
lastCol = cumulativeEnergyMap(:,n);
min_val, min_idx = min(lastCol);
horizontalSeam(n) = min_idx;

% backtracking
for y = n-1:-1:1
    if (min_idx == m)
        min_val, min_idx = min([cumulativeEnergyMap(min_idx-1, y), cumulativeEnergyMap(min_idx, y)]);
    elseif (min_idx == 1)
        min_val, min_idx = min([cumulativeEnergyMap(min_idx, y), cumulativeEnergy(min_idx+1, y)]);
    else
        min_val, min_idx = min([cumulativeEnergyMap(min_idx-1, y), cumulativeEnergyMap(min_idx, y), cumulativeEnergy(min_idx+1, y)]);
    end
    horizontalSeam(y) = min_idx;
end

end