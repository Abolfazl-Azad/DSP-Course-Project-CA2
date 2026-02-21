
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

L = 500000;                    
delta = [1; zeros(L-1,1)];
g_iir = filter(1, h, delta);    

w = hamming(L, "periodic");
g_fir = g_iir .* w;

g_fir = g_fir / sum(g_fir); 

x_fir = filter(g_fir, 1, y);

x_fir = x_fir / max(abs(x_fir) + 1e-12);

audiowrite("x_removed_echo_FIR.wav", x_fir, Fs);

x_iir = filter(1, h, y);
x_iir = x_iir / max(abs(x_iir) + 1e-12);
audiowrite("x_removed_echo_IIR.wav", x_iir, Fs);

