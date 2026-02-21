% 1) Load audio and report sampling frequency
[x, Fs] = audioread("Data/teletext.wav"); 
fprintf("Fs = %.0f Hz\n", Fs);

N  = length(x);
Ts = 1/Fs; 
t  = (0:N-1)/Fs;
