img = imread('inputSeamCarvingPrague.jpg');

for i=1:50
    [img, ~] = decrease_height(img, energy_img(img));
end

imwrite(img, 'outputReduceHeightPrague.png');

img2 = imread('inputSeamCarvingMall.jpg');

for i=1:50
    [img2, ~] = decrease_height(img2, energy_img(img2));
end

imwrite(img2, 'outputReduceHeightMall.png');