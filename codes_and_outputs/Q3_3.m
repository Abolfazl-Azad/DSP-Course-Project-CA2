
image_file = 'Data/a.tif'; 
filter_type = 'lowpass';
D0_values = [10, 30, 150, 450];
filter_names = {'ideal', 'butterworth', 'gaussian'};

img_original = imread(image_file);
img_gray = img_original;
[M, N] = size(img_gray);

F_original = fftshift(fft2(padarray(img_gray, [M-1, N-1], 'both')));
figure;
imshow(log(1 + abs(F_original)), []);
title('طیف فوریه تصویر اصلی (Log Scale)');

for idx_d0 = 1:length(D0_values)
    D0 = D0_values(idx_d0);
    
    for idx_filter = 1:length(filter_names)
        filter_name = filter_names{idx_filter};

        filtered_img = frequency_filter(img_gray, filter_type, filter_name, D0);
  
        figure;
        imshow(filtered_img);
        title(sprintf('Lowpass %s, D0 = %d', filter_name, D0));
        
    end
end
