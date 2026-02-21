
y0 = y - mean(y);

[ry, lags] = xcorr(y0, 'biased');  

tau = lags / Fs_y;

figure;
plot(tau, ry, 'LineWidth', 1.2);
grid on;
xlabel('Lag (seconds)');
ylabel('r_y(\tau)');
title('Autocorrelation of y[n] using xcorr');
