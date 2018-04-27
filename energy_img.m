function [energyImg] = energy_img(img)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
img = im2double(img);
img = rgb2gray(img);
[FX,FY] = gradient(img);
energyImg = sqrt(FX.^2 + FY.^2);
end
