function [energyImg] = energy_img(img)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
img_d = im2double(img);
img_gray = rgb2gray(img_d);
[FX,FY] = imgradientxy(img_gray);
energyImg = sqrt(FX.^2 + FY.^2);
end

