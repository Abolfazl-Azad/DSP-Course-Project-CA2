
[y, Fs_y] = audioread("Data/y.wav");
fprintf("Sampling frequency of y.wav: Fs = %.0f Hz\n", Fs_y);

if size(y,2) > 1
    y = mean(y, 2);
end

Ny  = length(y);
Tsy = 1/Fs_y;
ty  = (0:Ny-1)/Fs_y;
