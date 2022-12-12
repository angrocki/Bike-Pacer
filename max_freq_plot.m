function [max_mags, max_freq] = max_freq_plot(data, plot_var)
% Graph frequency plot after conducting Fourier transform
    x = data(:, 4); % z-axis data
    n = length(data(:, 1)); % length of time
    time_mat = data(:, 1);
    Fs = round(n/time_mat(end));

    if (mod(length(x), 2) ~= 0)
        x = x(1:end-1);
    end
    
    freq = linspace(-Fs/2, Fs/2-Fs/length(x),length(x));
    mag = 1/length(x)*fftshift(abs(fft(x)));

    % Only plot if asked to
    if (plot_var == 1)
        plot(freq, mag)
        ylabel('Magnitude of signal');
        xlabel('Frequency (Hz)');
        xlim([-5 5]);
    end
    
    [max_mags, max_idx] = maxk(1/length(x)*fftshift(abs(fft(x))),3);
    max_freq = freq(max_idx);
    max_freq = max_freq(max_freq > 0);
end