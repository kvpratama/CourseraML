a = double(imread('bird_small.png'));

a = a / 255;

a_size = size(a);

X = reshape(a, a_size(1) * a_size(2), a_size(3));

max_iters = 10;
K = 16;

initial_centroids = kMeansInitCentroids(X, K);

[centroids, idx] = runkMeans(X, initial_centroids, max_iters);

x_compressed = centroids(idx,:);

x_compressed = reshape(x_compressed, a_size(1), a_size(2), a_size(3));

subplot(1, 2, 1);
imagesc(a); 
title('Original');

% Display compressed image side by side
subplot(1, 2, 2);
imagesc(x_compressed)
title(sprintf('Compressed, with %d colors.', K));