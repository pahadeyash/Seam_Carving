A = imread('inputSeamCarvingPrague.jpg');
B = energy_img(A);
C = cumulative_min_energy_map(B, 'VERTICAL');
seam = find_vertical_seam(C);
view_seam(A, seam, 'VERTICAL');

