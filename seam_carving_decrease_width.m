img = imread('inputSeamCarvingPrague.jpg');

for i=1:100
    [reducedImg, ~] = decrease_width(img, energy_img(img));
end

imwrite(reducedImg, 'outputReduceWidthPrague.png');

img2 = imread('inputSeamCarvingMall.jpg');

for i=1:100
    [reducedImg2, ~] = decrease_width(img2, energy_img(img2));
end

imwrite(reducedImg2, 'outputReduceWidthMall.png');