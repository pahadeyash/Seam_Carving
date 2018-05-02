img = imread('inputSeamCarvingPrague.jpg');

for i=1:5
    [img, ~] = decrease_width(img, energy_img(img));
end

imwrite(img, 'outputReduceWidthPrague.png');

img2 = imread('inputSeamCarvingMall.jpg');

for i=1:5
    [img2, ~] = decrease_width(img2, energy_img(img2));
end

imwrite(img2, 'outputReduceWidthMall.png');