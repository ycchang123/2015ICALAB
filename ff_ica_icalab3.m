ecap32=data2(1,5).data(15).ecapICA32;
filter_ecapICA32=data2(1,5).data(15).filter_ecapICA32;
ecap128=data2(1,5).data(15).ecap128;
err_array=[];
shift_filter_ecapICA32=[];
err=0;
plotc2(ecap32,filter_ecapICA32);
for i=3:111
    shift_filter_ecapICA32(i)=ecap32(i);
end
plotc2(ecap32,shift_filter_ecapICA32);

for i=19:40
    err_unit=ecap128(i)-ecap32(i);
    abs_err_unit=abs(err_unit);
    err=err+abs_err_unit;
    err_array = [err_array err_unit];
end
figure;
plot(err_array);

Fs = 56000;                    % Sampling frequency
T = 1/Fs;                     % Sample time
L = 40-19+1;                     % Length of signal
t = (0:L-1)*T;                % Time vector
hold all;
plot(Fs*t+1,err_array);

NFFT = 2^nextpow2(L); % Next power of 2 from length of y
%Y = fft(y,NFFT)/L;
Y = fft(err_array,NFFT)/L;
f = Fs/2*linspace(0,1,NFFT/2+1);

% Plot single-sided amplitude spectrum.
figure;
plot(f,2*abs(Y(1:NFFT/2+1))) 
title('Single-Sided Amplitude Spectrum of y(t)')
xlabel('Frequency (Hz)')
ylabel('|Y(f)|')

disp(err);
