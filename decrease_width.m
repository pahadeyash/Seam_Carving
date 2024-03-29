function [reducedColorImg,reducedEnergyImg] = decrease_width(im,energyImg)
%DECREASE_WIDTH Summary of this function goes here
%   Detailed explanation goes here
[m,n,d] = size(im);
reducedColorImg = uint8(zeros(m, n-1, d));
reducedEnergyImg = double(zeros(m, n-1));

cumulativeEnergyMap = cumulative_min_energy_map(energyImg, 'VERTICAL');
seam = find_vertical_seam(cumulativeEnergyMap);

for i=1:m
      if seam(i) == 1
          reducedColorImg(i,:,1) = im(i, seam(i)+1:end, 1);
          reducedColorImg(i,:,2) = im(i, seam(i)+1:end, 2);
          reducedColorImg(i,:,3) = im(i, seam(i)+1:end, 3);
          reducedEnergyImg(i,:) = energyImg(i, seam(i)+1:end);
      else
          reducedColorImg(i,:,1) = im(i, [1:seam(i)-1 seam(i)+1:end],1);
          reducedColorImg(i,:,2) = im(i, [1:seam(i)-1 seam(i)+1:end],2);
          reducedColorImg(i,:,3) = im(i, [1:seam(i)-1 seam(i)+1:end],3);
          reducedEnergyImg(i,:) = energyImg(i, [1:seam(i)-1 seam(i)+1:end]);
      end
end  
    
end


