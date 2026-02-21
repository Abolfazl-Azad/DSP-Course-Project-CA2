

Hd = fdatool_BP();

x_fir = filter(Hd, x_iir);

x_final = x_fir / max(abs(x_fir) + 1e-12);

audiowrite("x_final_no_echo_no_noise.wav", x_final, Fs);

