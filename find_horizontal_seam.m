function horizontalSeam = find_horizontal_seam(cumulativeEnergyMap)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
[m,n] = size(cumulativeEnergyMap);
 
horizontalSeam = zeros(1,n);

A = permute(cumulativeEnergyMap, [2 1 3]);
horizontalSeam = find_vertical_seam(A);

end