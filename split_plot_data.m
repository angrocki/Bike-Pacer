function [t_matrix, z_matrix, t_array, f_array] = split_plot_data(data)
    rows = height(data); % Find # of rows in data
    increment = floor(rows/5); % Find the integer to increment the sections by
    section = increment; 
    row_count = 1;
    start = row_count;
    stop = increment;

    % Instantiate empty time and z matrices
    t_matrix = zeros(section, 5);
    z_matrix = zeros(section, 5);
    t_array = zeros(1,5);
    f_array  = zeros(1,5);
    % Put sections into matrices
    for i = 1:5
        t_matrix(:, i) = data(start:stop, 1);
        z_matrix(:, i) = data(start:stop, 4);
        t_array(i) = t_matrix(1, i);
        start = start + increment;
        stop = start + increment - 1;
  
    end

    % Do the FFT
    dt = t_matrix(1, 1) - t_matrix(1, 2); % Find the smallest timestep
    Fs = 1/dt;
    % Z Freqency Plot
    X = z_matrix; % Z-matrix
    if(mod(length(X),2) ~=0)
        X = X(1:end-1);
    end
    
    freq = linspace(-Fs/2, Fs/2-Fs/length(X),length(X));
    mag = 1/length(X)*fftshift(abs(fft(X)));
    
%     title(sprintf("Freqency Plot of Z for \n%s", data));
    title("Frequency for Plot of Z Axis");
    subtitle("Max = " + m)
    ylabel('Magnitude of signal');
    xlabel('Frequency (Hz)');
    xlim([-0.05, 0.05]);
end