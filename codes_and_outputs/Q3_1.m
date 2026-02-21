
image = zeros(256, 256);
image(1:128, :) = 1; 
image(129:256, :) = 0;

figure;
imshow(image, []);
title('Half Black, Half White Image');
