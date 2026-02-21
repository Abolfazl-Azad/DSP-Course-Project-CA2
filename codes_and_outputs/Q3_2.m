F = fft2(image);

F_shifted = fftshift(F);

magnitude = abs(F_shifted);

magnitude_normalized = uint8(magnitude / max(magnitude) * 255);

figure;
imshow(magnitude_normalized, []);
title('Magnitude Spectrum (2D FFT)');
