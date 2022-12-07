function [f, m] = make_freq_plot(x, Fs)

% make a frequency domain plot with frequency labels
%
%   x = input signal
%   Fs = sampling frequency in Hz

if(mod(length(x),2) ~=0)
    x = x(1:end-1);
end
freq = linspace(-Fs/2, Fs/2-Fs/length(x),length(x));
mag = 1/length(x)*fftshift(abs(fft(x)));
[m, index] = max(mag);
f = abs(freq(index));

plot(linspace(-Fs/2, Fs/2-Fs/length(x),length(x)), 1/length(x)*fftshift(abs(fft(x))))

ylabel('Magnitude of signal');
xlabel('Frequency (Hz)');
subtitle("Max Magnitude = " + m +"at frequency " + f +"Hz")
end 