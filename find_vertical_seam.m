function [verticalSeam] = find_vertical_seam(cumulativeEnergyMap)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    [m,n] = size(cumulativeEnergyMap);
    verticalSeam = zeros(1,m);
    [~,temp_idx] = min(cumulativeEnergyMap(m, :));
    verticalSeam(m) = temp_idx;
    for i = m-1:-1:1
        index = verticalSeam(i+1);
        if verticalSeam(i+1) == 1
            [~,temp_idx] = min([inf, cumulativeEnergyMap(i,temp_idx), cumulativeEnergyMap(i, index+1)]);
            switch(temp_idx)
                case 1
                    error('not possible: something is wrong');
                case 2
                    verticalSeam(i) = index;
                case 3
                     verticalSeam(i) = index+1;
            end
        elseif verticalSeam(i+1) == n
            [~,temp_idx] = min([cumulativeEnergyMap(i,index-1), cumulativeEnergyMap(i, index), inf]);
            switch(temp_idx)
                case 1
                    verticalSeam(i) = index-1;
                case 2
                    verticalSeam(i) = index;
                case 3
                     error('not possible: somethis is wrong');
            end
        else
            [~,temp_idx] = min([cumulativeEnergyMap(i,index-1), cumulativeEnergyMap(i,index), cumulativeEnergyMap(i, index+1)]);
            switch(temp_idx)
                case 1
                    verticalSeam(i) = index-1;
                case 2
                    verticalSeam(i) = index;
                case 3
                    verticalSeam(i) = index+1;
            end
        end
    end
end