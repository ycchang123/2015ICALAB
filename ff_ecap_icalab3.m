Fs = 56000;T = 1/Fs;L = 80-4+1;t = (0:L-1)*T;
NFFT = 2^nextpow2(L);f = Fs/2*linspace(0,1,NFFT/2+1);

ecap32=data2(1,5).data(7).ecapICA32;
%ecapICA32=data2(1,5).data(15).ecapICA32;
ecap128=data2(1,5).data(7).ecap128;
err_array=[];
err=0;
for i=4:80
    err_unit=ecap128(i)-ecap32(i);
    abs_err_unit=abs(err_unit);
    err=err+abs_err_unit;
    err_array = [err_array err_unit];
end
%figure;plot(err_array);

Y = fft(err_array,NFFT)/L;
figure;hold all;
subplot(3,1,1);
plot(f,2*abs(Y(1:NFFT/2+1))) 
title('AP ecap128 substract ICA32 Amplitude Spectrum')
xlabel('Frequency (Hz)')
ylabel('|Y(f)|')

ecap128=ecap32(4:80);
Y = fft(ecap128,NFFT)/L;
subplot(3,1,2);
plot(f,2*abs(Y(1:NFFT/2+1))) 
title('ICA ecap32 Amplitude Spectrum of y(t)')
xlabel('Frequency (Hz)')
ylabel('|Y(f)|')

ecapstd=data2(1,5).data(7).ecap128(4:80);
Y = fft(ecapstd,NFFT)/L;
subplot(3,1,3);
plot(f,2*abs(Y(1:NFFT/2+1))) 
title('AP ecap128 Amplitude Spectrum of y(t)')
xlabel('Frequency (Hz)')
ylabel('|Y(f)|')

%%
ecap32=data2(1,5).data(10).ecapICA32;
%ecapICA32=data2(1,5).data(15).ecapICA32;
ecap128=data2(1,5).data(10).ecap128;
err_array=[];
err=0;
for i=4:80
    err_unit=ecap128(i)-ecap32(i);
    abs_err_unit=abs(err_unit);
    err=err+abs_err_unit;
    err_array = [err_array err_unit];
end
Y = fft(err_array,NFFT)/L;
subplot(3,1,1);hold all;
plot(f,2*abs(Y(1:NFFT/2+1))) 

ecap128=ecap32(4:80);
Y = fft(ecap128,NFFT)/L;
subplot(3,1,2);hold all;
plot(f,2*abs(Y(1:NFFT/2+1))) 

ecapstd=data2(1,5).data(10).ecap128(4:80);
Y = fft(ecapstd,NFFT)/L;
subplot(3,1,3);hold all;
plot(f,2*abs(Y(1:NFFT/2+1))) 
title('AP ecap128 Amplitude Spectrum of y(t)')
xlabel('Frequency (Hz)')
ylabel('|Y(f)|')
%%
ecap32=data2(1,5).data(15).ecapICA32;
%ecapICA32=data2(1,5).data(15).ecapICA32;
ecap128=data2(1,5).data(15).ecap128;
err_array=[];
err=0;
for i=4:80
    err_unit=ecap128(i)-ecap32(i);
    abs_err_unit=abs(err_unit);
    err=err+abs_err_unit;
    err_array = [err_array err_unit];
end
Y = fft(err_array,NFFT)/L;
subplot(3,1,1);hold all;
plot(f,2*abs(Y(1:NFFT/2+1))) 
legend('Level 7','Level 10','Level 15');

ecap128=ecap32(4:80);
Y = fft(ecap128,NFFT)/L;
subplot(3,1,2);hold all;
plot(f,2*abs(Y(1:NFFT/2+1))) 
legend('Level 7','Level 10','Level 15');

ecapstd=data2(1,5).data(15).ecap128(4:80);
Y = fft(ecapstd,NFFT)/L;
subplot(3,1,3);hold all;
plot(f,2*abs(Y(1:NFFT/2+1))) 
title('AP ecap128 Amplitude Spectrum of y(t)')
xlabel('Frequency (Hz)')
ylabel('|Y(f)|')
legend('Level 7','Level 10','Level 15');