A = imread('inputSeamCarvingPrague.jpg');
B = energy_img(A);
C = cumulative_min_energy_map(B, 'HORIZONTAL');
seam = find_horizontal_seam(C);
view_seam(A, seam, 'HORIZONTAL');

