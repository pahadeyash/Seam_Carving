function [verticalSeam] = find_vertical_seam(cumulativeEnergyMap)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    copy = cumulativeEnergyMap;
    [m,n] = size(copy);
    verticalSeam = zeros(1,m);
    [~,temp_idx] = min(copy(m, :));
    verticalSeam(m) = temp_idx;
    for i = m-1:-1:1
        index = verticalSeam(i+1);
        if verticalSeam(i+1) == 1
            [~,temp_idx] = min([255, copy(i,temp_idx), copy(i, index+1)]);
            switch(temp_idx)
                case 1
                    error('not possible: something is wrong');
                case 2
                    verticalSeam(i) = index;
                case 3
                     verticalSeam(i) = index+1;
            end
        elseif verticalSeam(i+1) == n
            [~,temp_idx] = min([copy(i,index-1), copy(i, index), 255]);
            switch(temp_idx)
                case 1
                    verticalSeam(i) = index-1;
                case 2
                    verticalSeam(i) = index;
                case 3
                     error('This is not possible');
            end
        else
            [~,temp_idx] = min([copy(i,index-1), copy(i,index), copy(i, index+1)]);
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