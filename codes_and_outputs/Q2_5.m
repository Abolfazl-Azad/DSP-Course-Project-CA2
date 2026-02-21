

[y, Fs] = audioread("Data/y.wav");
if size(y,2)>1, y = mean(y,2); end
y = y - mean(y);

k1    = 5500;
k2    = 9000;
alpha = 0.2611;
beta  = 0.1794;

N = k2 + 1;
h = zeros(N,1);
h(1)      = 1;
h(k1+1)   = alpha;
h(k2+1)   = beta;

x_hat = filter(1, h, y);

x_hat = x_hat / max(abs(x_hat));

soundsc(y, Fs);
pause(length(y)/Fs + 1);

soundsc(x_hat, Fs);
audiowrite("x_recovered.wav", x_hat, Fs);
