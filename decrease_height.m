function [reducedColorImg, reducedEnergyImg] = decrease_height(im,energyImg)
%DECREASE_HEIGHT Summary of this function goes here
%   Detailed explanation goes here
[m,n,d] = size(im);
reducedColorImg = uint8(zeros(m-1, n, d));
reducedEnergyImg = double(zeros(m-1, n));

cumulativeEnergyMap = cumulative_min_energy_map(im, 'HORIZONTAL');
seam = find_horizontal_seam(cumulativeEnergyMap);

for i=1:n
    if seam(i) == 1
        reducedColorImg(:,i,1) = im(seam(i)+1:end, i, 1);
        reducedColorImg(:,i,2) = im(seam(i)+1:end, i, 2);
        reducedColorImg(:,i,3) = im(seam(i)+1:end, i, 3);
        reducedEnergyImg(:,i) = energyImg(seam(i)+1:end, i);
    else
        reducedColorImg(:,i,1) = im([1:seam(i)-1 seam(i)+1:end], i, 1);
        reducedColorImg(:,i,2) = im([1:seam(i)-1 seam(i)+1:end], i, 2);
        reducedColorImg(:,i,3) = im([1:seam(i)-1 seam(i)+1:end], i, 3);
        reducedEnergyImg(:,2) = energyImg([1:seam(i)-1 seam(i)+1:end], i);
    end
end

end