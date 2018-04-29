function verticalSeam = find_vertical_seam(cumulativeEnergyMap)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[m,n] = size(cumulativeEnergyMap);

verticalSeam = cumulativeEnergyMap(:,0);

% finding minimum in last row
lastRow = cumulativeEnergyMap(m,:);
min_val, min_idx = min(lastRow);
verticalSeam(m) = min_idx;

% backtracking
for y = m-1:-1:1
    if (min_idx == n)
        min_val, min_idx = min([cumulativeEnergyMap(min_idx-1, y), cumulativeEnergyMap(min_idx, y)]);
    elseif (min_idx == 1)
        min_val, min_idx = min([cumulativeEnergyMap(min_idx, y), cumulativeEnergy(min_idx+1, y)]);
    else
        min_val, min_idx = min([cumulativeEnergyMap(min_idx-1, y), cumulativeEnergyMap(min_idx, y), cumulativeEnergy(min_idx+1, y)]);
    end
    verticalSeam(y) = min_idx;
end

end