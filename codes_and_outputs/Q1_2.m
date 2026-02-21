
N  = length(x);
Ts = 1/Fs;

x0 = x - mean(x);
Nfft = 2^nextpow2(N);
Xdis = fft(x0, Nfft);
f = (-Nfft/2 : Nfft/2-1) * (Fs/Nfft);
Xdis_shift = fftshift(Xdis);
Xcon = Ts * Xdis_shift;

P = abs(Xcon).^2;

figure;
plot(f, P);
grid on;
xlabel("Frequency (Hz)");
ylabel("|X_{con}(j\Omega)|^2");
title("Estimated Continuous-Time Power Spectrum (Ts-scaled FFT)");
