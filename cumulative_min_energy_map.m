function [cumulativeEnergyMap] = cumulative_min_energy_map(energyImg,seamDirection)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
[m,n] = size(energyImg);

cumulativeEnergyMap = energyImg;
if strcmp(seamDirection, 'VERTICAL')
    for x = 2:m % iterating row
        cumulativeEnergyMap(x, 1) = energyImg(x,1) + min([cumulativeEnergyMap(x-1, 1), cumulativeEnergyMap(x-1,2)]);
        cumulativeEnergyMap(x, n) = energyImg(x,n) + min([cumulativeEnergyMap(x-1, n-1), cumulativeEnergyMap(x-1, n)]);
        for y = 2:n-1 % iterating column
            cumulativeEnergyMap(x,y) = energyImg(x,y) + min([cumulativeEnergyMap(x-1, y-1), cumulativeEnergyMap(x-1,y), cumulativeEnergyMap(x-1, y+1)]);
        end
    end

elseif strcmp(seamDirection, 'HORIZONTAL')
    for y = 2:n % iterating column
        cumulativeEnergyMap(1, y) = energyImg(1, y) + min([cumulativeEnergyMap(1, y-1), cumulativeEnergyMap(2, y-1)]);
        cumulativeEnergyMap(m, y) = energyImg(m, y) + min([cumulativeEnergyMap(m-1, y-1), cumulativeEnergyMap(m, y-1)]);
        for x = 2:m-1 % iterating row
            cumulativeEnergyMap(x,y) = energyImg(x, y) + min([cumulativeEnergyMap(x-1,y-1), cumulativeEnergyMap(x, y-1), cumulativeEnergyMap(x+1, y-1)]);
        end
    end
end
end