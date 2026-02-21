function filtered_image = frequency_filter(image, filter_type, filter_name, D0)
    f = double(image);
    [M_orig, N_orig] = size(f); 

    M_pad = 2*M_orig - 1;
    N_pad = 2*N_orig - 1;

    pad_rows = M_pad - M_orig;
    pad_cols = N_pad - N_orig;

    pad_r1 = floor(pad_rows/2);
    pad_r2 = pad_rows - pad_r1;
    pad_c1 = floor(pad_cols/2);
    pad_c2 = pad_cols - pad_c1;
    
    f_padded = padarray(f, [pad_r1, pad_c1], 'post');
    f_padded = padarray(f_padded, [pad_r2, pad_c2], 'pre');

    P = M_pad; 
    Q = N_pad;

    f_padded = zeros(P, Q);
    f_padded(1:M_orig, 1:N_orig) = f; 
  
    F = fftshift(fft2(f_padded));

    [V, U] = meshgrid(0:Q-1, 0:P-1); 
    U = U - Q/2; 
    V = V - P/2; 
    D = sqrt(U.^2 + V.^2);
    H = zeros(P, Q);
    if strcmp(filter_name, 'ideal')
        if strcmp(filter_type, 'lowpass')
            H(D <= D0) = 1;
        else
            H(D > D0) = 1;
        end
    elseif strcmp(filter_name, 'butterworth')
        n_order = 2*2;
        if strcmp(filter_type, 'lowpass')
            H = 1 ./ (1 + (D ./ D0).^(n_order));
        else
            H = 1 - 1 ./ (1 + (D ./ D0).^(n_order));
        end
    elseif strcmp(filter_name, 'gaussian')
        if strcmp(filter_type, 'lowpass')
            H = exp(-(D.^2) / (2*D0^2));
        else
            H = 1 - exp(-(D.^2) / (2*D0^2));
        end
    end

    G = H .* F; 

    g = ifft2(ifftshift(G));
    g = g(1:M_orig, 1:N_orig);

    filtered_image = uint8(real(g));
end
