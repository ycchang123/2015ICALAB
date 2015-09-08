[ecap128,ecap_avg,ECAP1]=icalab2_fft('src42\',64,'jadetd','test',5,18000);

Fs = 56000;                    % Sampling frequency
T = 1/Fs;                     % Sample time
L = 111;                     % Length of signal
t = (0:L-1)*T;                % Time vector

NFFT = 2^nextpow2(L); % Next power of 2 from length of y
Y1 = fft(ecap128,NFFT)/L;Y2 = fft(ecap_avg,NFFT)/L;Y3 = fft(ECAP1,NFFT)/L;
f = Fs/2*linspace(0,1,NFFT/2+1);
figure;hold all;
plot(f,2*abs(Y1(1:NFFT/2+1)));plot(f,2*abs(Y2(1:NFFT/2+1)));plot(f,2*abs(Y3(1:NFFT/2+1)));
legend('AP ECAP','64s AP ECAP','64sICALAB algo jadetd ECAP');
title('ECAP FFT cut off feq=18000')
xlabel('Frequency (Hz)')
ylabel('|Y(f)|')

