function Hd = design_lowpass_filter()
    % Design a lowpass FIR filter using Kaiser window
    Fs = 48000;  % Sampling frequency
    Fpass = 3800; % Passband edge (Hz)
    Fstop = 4000; % Stopband edge (Hz)
    Apass = 1;    % Passband ripple (dB)
    Astop = 60;   % Stopband attenuation (dB)
    N = 201;      % Filter order
    Beta = 7.685; % Kaiser window parameter
    
    b = fir1(N, [Fpass Fstop]/(Fs/2), 'lowpass', kaiser(N+1, Beta), 'scale');
    Hd = dfilt.dffir(b);
end
