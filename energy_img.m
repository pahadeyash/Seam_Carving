function [energyImg] = energy_img(img)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
img = rgb2gray(img);
[FX,FY] = imgradientxy(img);
energyImg = sqrt(FX.^2 + FY.^2);
end

