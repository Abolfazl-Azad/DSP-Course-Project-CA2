function filtered_image_no_pad = gaussian_lp_no_pad(image, D0)
    f = double(image);
    [M, N] = size(f); 

    F = fftshift(fft2(f));

    [V, U] = meshgrid(0:N-1, 0:M-1); 
    U = U - N/2;
    V = V - M/2; 
    D = sqrt(U.^2 + V.^2);
   
    H = exp(-(D.^2) / (2*D0^2));

    G = H .* F; 

    g = ifft2(ifftshift(G));
   
    filtered_image_no_pad = uint8(real(g)); 
end

