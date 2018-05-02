function horizontalSeam = find_horizontal_seam(cumulativeEnergyMap)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
[m,n] = size(cumulativeEnergyMap);
 
horizontalSeam = zeros(1,n);
% 
% % finding minimum in last column
% lastCol = cumulativeEnergyMap(:,n);
% [~, min_idx] = min(lastCol);
% horizontalSeam(n) = min_idx;
% 
% % backtracking
% for y = n-1:-1:1
%     if (min_idx == m)
%         [~, temp_idx] = min([cumulativeEnergyMap(min_idx-1, y), cumulativeEnergyMap(min_idx, y)]);
%     elseif (min_idx == 1)
%         [~, temp_idx] = min([cumulativeEnergyMap(min_idx, y), cumulativeEnergyMap(min_idx+1, y)]);
%     else
%         [~, temp_idx] = min([cumulativeEnergyMap(min_idx-1, y), cumulativeEnergyMap(min_idx, y), cumulativeEnergyMap(min_idx+1, y)]);
%     end
%     
%     if temp_idx == 2
%         min_idx = min_idx - 1;
%     elseif temp_idx ==3
%         min_idx = min_idx + 1;
%     end
%     
%     horizontalSeam(y) = min_idx; 
% end
A = permute(cumulativeEnergyMap, [2 1 3]);
horizontalSeam = find_vertical_seam(A);

end