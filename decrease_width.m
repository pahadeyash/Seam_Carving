function [reducedColorImg,reducedEnergyImg] = decrease_width(im,energyImg)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
[m,n,d] = size(im);
reducedColorImg = uint8(zeros(m, n-1, d));
reducedEnergyImg = double(zeros(m, n-1));

cumulativeEnergyMap = cumulative_min_energy_map(im, 'VERTICAL');
seam = find_vertical_seam(cumulativeEnergyMap);

for i = 1:m
    row = im(i,:,:);
    row(seam(i)) = [];
    reducedColorImg(i,:,:) = row;
    
    row = energyImg(i,:);
    row(seam(i)) = [];
    reducedEnergyImg(i,:) = row;
end
    
end

