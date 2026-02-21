

[y, Fs] = audioread("Data/y.wav");
if size(y,2) > 1
    y = mean(y,2);        
end
y = y - mean(y);        

[ry, lags] = xcorr(y, 'biased');
r0 = ry(lags==0);                 

ryN = ry / r0;
pos = (lags > 0);
lagsP = lags(pos);
ryP   = ryN(pos);

minDelaySec = 0.010;               
minDelaySamp = round(minDelaySec*Fs);

valid = (lagsP >= minDelaySamp);
lagsP2 = lagsP(valid);
ryP2   = ryP(valid);

minPeakDistSec = 0.020;             
minPeakDistSamp = round(minPeakDistSec*Fs);

[pks, locs] = findpeaks(ryP2, ...
    'MinPeakDistance', minPeakDistSamp, ...
    'SortStr','descend');

k1 = lagsP2(locs(1));
k2 = lagsP2(locs(2));

if k2 < k1
    tmp = k1; k1 = k2; k2 = tmp;
    tmp = locs(1); locs(1) = locs(2); locs(2) = tmp;
    tmp = pks(1);  pks(1)  = pks(2);  pks(2)  = tmp;
end

alpha = ryN(lags==k1);  
beta  = ryN(lags==k2);   

tau1 = k1/Fs;
tau2 = k2/Fs;

fprintf("Estimated delays:\n");
fprintf("k1 = %d samples  (tau1 = %.6f s)\n", k1, tau1);
fprintf("k2 = %d samples  (tau2 = %.6f s)\n", k2, tau2);

fprintf("\nEstimated echo gains:\n");
fprintf("alpha ~= %.4f\n", alpha);
fprintf("beta  ~= %.4f\n", beta);

figure;
tau = lags/Fs;
plot(tau, ryN, 'LineWidth', 1.1); grid on;
xlabel("Lag (s)");
ylabel("r_y(\tau) / r_y(0)");
title("Normalized autocorrelation of y[n] (echo peaks show k1,k2)");
xline(tau1,'--'); xline(tau2,'--');
