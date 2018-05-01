A = imread('inputSeamCarvingPrague.jpg');
B = energy_img(A);
C = cumulative_min_energy_map(B, 'VERTICAL');
find_vertical_seam(C);