

if size(x,2) > 1
    x = mean(x,2);
end

x = x - mean(x);

winLen  = round(0.080 * Fs);     % 80 ms window 
hopLen  = round(0.010 * Fs);     % 10 ms hop  
noverlap = winLen - hopLen;

nfft = 2^nextpow2(4*winLen);    

w = hamming(winLen, "periodic"); % window

[S, F, T] = spectrogram(x, w, noverlap, nfft, Fs, "yaxis");  

Pdb = 10*log10(abs(S).^2 + 1e-12);

figure;
imagesc(T, F, Pdb);
axis xy;
grid on;
xlabel("Time (s)");
ylabel("Frequency (Hz)");
title("Spectrogram of teletext.wav (STFT Power, dB)");
ylim([0 2000]);               
colormap jet;               
colorbar;

doExtract = false;

if doExtract
    
    fmin = 600; 
    fmax = 1800;
    idx = (F >= fmin) & (F <= fmax);

    Sband = abs(S(idx, :)).^2;   
    Fband = F(idx);

    f1 = zeros(1, numel(T));
    f2 = zeros(1, numel(T));
    p1 = zeros(1, numel(T));
    p2 = zeros(1, numel(T));

    for k = 1:numel(T)
        col = Sband(:, k);

        [pks, locs] = findpeaks(col, ...
            "MinPeakDistance", round(30/(Fband(2)-Fband(1))), ... 
            "SortStr", "descend");

        if numel(locs) >= 2
            f1(k) = Fband(locs(1));  p1(k) = pks(1);
            f2(k) = Fband(locs(2));  p2(k) = pks(2);
        elseif isscalar(locs)
            f1(k) = Fband(locs(1));  p1(k) = pks(1);
            f2(k) = NaN;             p2(k) = NaN;
        else
            f1(k) = NaN; f2(k) = NaN;
        end
    end

    hold on;
    plot(T, f1, "w.", "MarkerSize", 6);
    plot(T, f2, "w.", "MarkerSize", 6);
    hold off;
end
