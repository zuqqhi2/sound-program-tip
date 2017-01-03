function plot_power_spectrum_of(title_str, filename, y_axis_max)
  # sampling frequency [Hz]
  fs = 44100;

  # Load wav file
  x = wavread(filename);
  x = x(:,1);
  n = length(x);

  # Fourier Transform
  y = fft(x);
  y0 = fftshift(y);
  power_y0 = y0 .* y0;
  
  # plot power spectrum
  f0 = (0:n/2-1)*(fs/n);
  hold on
  title(title_str);
  axis([0 15000 0 y_axis_max]);
  xlabel('Frequency [Hz]');
  ylabel('Amplitude');
  plot(f0, 2*abs(y0(n/2:n-1,:))/n);
  hold off;
end
