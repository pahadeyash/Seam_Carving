img = imread('inputSeamCarvingPrague.jpg');
energyImg = energy_img(img);

for i=1:100
    [img, energyImg] = decrease_width(img, energyImg);
end

imwrite(img, 'outputReduceWidthPrague.png');

img2 = imread('inputSeamCarvingMall.jpg');
energyImg2 = energy_img(img2);
for i=1:100
    [img2, energyImg2] = decrease_width(img2, energyImg2);
end

imwrite(img2, 'outputReduceWidthMall.png');

