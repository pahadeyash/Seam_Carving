function [img] = view_seam(im, seam, seamDirection)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

[m,n,p] = size(im);
if strcmp(seamDirection, 'VERTICAL')
    for (i = 1:m)
        im(i,seam(i),:) = [255,0,0];
    end
elseif strmp(seamDirection, 'HORIZONTAL')
    for (i = 1:n)
        im(seam(i), i, :) = [255,0,0];
    end
end

imagesc(im);
    
end

