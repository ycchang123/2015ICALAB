function [x,y]=fft_icalab3(input_signal)


Fs = 56000;                    % Sampling frequency
T = 1/Fs;                     % Sample time
L = length(input_signal);                     % Length of signal
%t = (0:L-1)*T;                % Time vector

NFFT = 2^nextpow2(L); % Next power of 2 from length of y
Y1 = fft(input_signal,NFFT)/L;
y=(2*abs(Y1(1:NFFT/2+1)));
x = Fs/2*linspace(0,1,NFFT/2+1);



