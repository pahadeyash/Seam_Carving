function [cumulativeEnergyMap] = cumulative_min_energy_map(energyImg,seamDirection)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[m,n] = size(energyImg);

cumulativeEnergyMap = energyImg;
if strcmp(seamDirection, 'VERTICAL')
    for x = 2:m
        cumulativeEnergyMap(x, 1) = energyImg(x,1) + min([cumulativeEnergyMap(x-1, 1), cumulativeEnergyMap(x-1,2)]);
        cumulativeEnergyMap(x, n) = energyImg(x,n) + min([cumulativeEnergyMap(x-1, n-1), cumulativeEnergyMap(x-1, n)]);
        for y = 2:n-1
            cumulativeEnergyMap(x,y) = energyImg(x,y) + min([cumulativeEnergyMap(x-1, y-1), cumulativeEnergyMap(x-1,y), cumulativeEnergyMap(x-1, y+1)]);
        end
    end

elseif strcmp(seamDirection, 'HORIZONTAL')
    for y = 2:m
        cumulativeEnergyMap(y, 1) = energyImg(y,1) + min([cumulativeEnergyMap(y-1, 1), cumulativeEnergyMap(y-1,2)]);
        cumulativeEnergyMap(y, n) = energyImg(y,n) + min([cumulativeEnergyMap(y-1, n-1), cumulativeEnergyMap(y-1, n)]);
        for x = 2:n-1
            cumulativeEnergyMap(x,y) = energyImg(x,y) + min([cumulativeEnergyMap(x-1, y-1), cumulativeEnergyMap(x-1,y), cumulativeEnergyMap(x-1, y+1)]);
        end
    end
end
end