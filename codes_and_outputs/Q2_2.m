
Fs = Fs_y;
Ts = 1/Fs;
Ny = length(y);
y0 = y - mean(y);
Nfft = 2^nextpow2(Ny);

f = (-Nfft/2 : Nfft/2-1) * (Fs/Nfft);

Ydis = fft(y0, Nfft);
Ydis_shift = fftshift(Ydis);

Ycon = Ts * Ydis_shift;

Mag = abs(Ycon);
P   = Mag.^2;

figure;
plot(f, P);
grid on;
xlabel("Frequency (Hz)");
ylabel("|Y_{con}(j\Omega)|^2");
title("Estimated Continuous-Time Spectrum of y[n] (FFT + Ts scaling)");

Pdb = 10*log10(P + 1e-12);
peak_db = max(Pdb);

thr_db = peak_db - 30;
idx = (Pdb >= thr_db);

if any(idx)
    fL = f(find(idx,1,"first"));
    fH = f(find(idx,1,"last"));
    BW = fH - fL;

    fprintf("Approx. bandwidth (-30 dB): %.1f Hz (from %.1f to %.1f Hz)\n", BW, fL, fH);
else
    fprintf("Could not estimate bandwidth: spectrum below threshold everywhere.\n");
end
