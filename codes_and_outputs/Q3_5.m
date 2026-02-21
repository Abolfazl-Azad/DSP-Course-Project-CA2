
clear; close all; clc;

    img_gray = zeros(64, 64);
    img_gray(17:48, 17:48) = 1;
img_gray = im2double(img_gray); 
[M, N] = size(img_gray);
D0 = 50;

function H = create_gaussian_filter(size_M, size_N, D0)
    [U, V] = meshgrid((0:size_N-1) - floor(size_N/2), (0:size_M-1) - floor(size_M/2));
    D_sq = U.^2 + V.^2;
    H = exp(-D_sq / (2 * D0^2));
end

function filtered_img = frequency_filter_process(img, D0, use_padding)
    [m, n] = size(img);
    
    if use_padding
      
        P = 2*m - 1; 
        Q = 2*n - 1;
        padded_img = zeros(P, Q);
        padded_img(1:m, 1:n) = img;
        
        F = fft2(padded_img);
        H = create_gaussian_filter(P, Q, D0);
    else

        F = fft2(img);
        H = create_gaussian_filter(m, n, D0);
    end
    
    G = F .* H;
    g = ifft2(G);

    if use_padding
        filtered_img = real(g(1:m, 1:n));
    else
        filtered_img = real(g);
    end

    min_val = min(filtered_img(:));
    max_val = max(filtered_img(:));

    if max_val - min_val > 1e-9
        filtered_img = (filtered_img - min_val) / (max_val - min_val);
    end
end

filtered_img_no_pad = frequency_filter_process(img_gray, D0, false);

figure;
subplot(1, 2, 1);
imshow(img_gray);
title('تصویر ورودی اصلی');

subplot(1, 2, 2);
imshow(filtered_img_no_pad);
title(sprintf('LPF Gaussian (D0 = %d) - بدون Padding', D0));

filtered_img_with_pad = frequency_filter_process(img_gray, D0, true);

figure;
subplot(1, 2, 1);
imshow(img_gray);
title('تصویر ورودی اصلی');

subplot(1, 2, 2);
imshow(filtered_img_with_pad);
title(sprintf('LPF Gaussian (D0 = %d) - با Padding Zero', D0));


