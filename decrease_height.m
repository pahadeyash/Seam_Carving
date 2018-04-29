function [reducedColorImg,reducedEnergyImg] = decrease_height(im,energyImg)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
[m,n,d] = size(im);
reducedColorImg = uint8(zeros(m, n-1, d));
reducedEnergyImg = double(zeros(m, n-1));

cumulativeEnergyMap = cumulative_min_energy_map(im, 'HORIZONTAL');
seam = find_vertical_seam(cumulativeEnergyMap);

for i = 1:n
    column = im(:,i,:);
    column(seam(i)) = [];
    reducedColorImg(:,i,:) = column;
    
    column = energyImg(:,i);
    column(seam(i)) = [];
    reducedEnergyImg(i,:) = column;
end
    
end