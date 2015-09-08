function  data=icalab4_lis(src_dir,algo,filter_order,cut_freq)
src_dir='src42v2\';
algo='jadetd';
filter_order=10;
cut_freq=15000;

fs=56000;
ecap128_array=[];ecap256_array=[];
filter_ecapICA32_array=[];ecap32_array=[];
filter_ecapICA64_array=[];ecap64_array=[];
MaxStart=31;MaxEnd=60;MinStart=11;MinEnd=30;
data=LoadModule2(src_dir);
for i=1:length(data)
    ecap32=data(i).ecap32;
    ecap64=data(i).ecap64;
    ecap128=data(i).ecap128; 
    ecap256=data(i).ecap256;
    cuLevel=data(i).cuLevel;
    
    [b, a]=butter(filter_order, cut_freq/(fs/2), 'low');
    data(i).ST0Avg32=filter(b,a,data(i).ST0Avg32);
    data(i).ST1Avg32=filter(b,a,data(i).ST1Avg32);
    data(i).ST2Avg32=filter(b,a,data(i).ST2Avg64);
    data(i).ST0Avg64=filter(b,a,data(i).ST0Avg64);
    data(i).ST1Avg64=filter(b,a,data(i).ST1Avg64);
    data(i).ST2Avg64=filter(b,a,data(i).ST2Avg64);
    
    
    S32=[data(i).ST0Avg32-data(i).ST2Avg32;data(i).ST1Avg32-data(i).ST2Avg32];
    Y32=icalab3_algo(S32,algo);
    [ECAPc ECAPa]=icalab3_pinv(S32,Y32);    
    [ARTIFACTc ARTIFACTa]=icalab3_pinv_artifact(S32,Y32);
    ecapICA32=0.5*(ECAPc+ECAPa);
    data(i).ecapICA32=ecapICA32;
    data(i).ARTIFACTc=ARTIFACTc;data(i).ARTIFACTa=ARTIFACTa; 
    data(i).ARTIFACTc_sub=S32(1,:)-ecapICA32;
    data(i).ARTIFACTa_sub=S32(2,:)-ecapICA32;
    
    S64=[data(i).ST0Avg64-data(i).ST2Avg64;data(i).ST1Avg64-data(i).ST2Avg64];
    Y64=icalab3_algo(S64,algo);
    [ECAPc ECAPa]=icalab3_pinv(S64,Y64);    
    ecapICA64=0.5*(ECAPc+ECAPa);
    data(i).ecapICA64=ecapICA64;
    
    [MaxVal,MaxIdx]=max(ecap128(MaxStart:MaxEnd));
    [MinVal,MinIdx]=min(ecap128(MinStart:MinEnd));
    tmp_array=[cuLevel;abs(MaxVal-MinVal)];ecap128_array=[ecap128_array tmp_array];
    
    [MaxVal,MaxIdx]=max(ecap256(MaxStart:MaxEnd));
    [MinVal,MinIdx]=min(ecap256(MinStart:MinEnd));
    tmp_array=[cuLevel;abs(MaxVal-MinVal)];ecap256_array=[ecap256_array tmp_array];
    

    %[b, a]=butter(filter_order, cut_freq/(fs/2), 'low');
    %filter_ecapICA32=filter(b,a,ecapICA32);
    filter_ecapICA32=ecapICA32;
    data(i).ecap32=ecap32;data(i).filter_ecapICA32=filter_ecapICA32;

    %filter_ecapICA64=filter(b,a,ecapICA64);
    filter_ecapICA64=ecapICA64;
    data(i).ecap64=ecap64;data(i).filter_ecapICA64=filter_ecapICA64;
        
    %moving average ecap_avg singal 
    [MaxVal,MaxIdx]=max(ecap32(MaxStart:MaxEnd));
    [MinVal,MinIdx]=min(ecap32(MinStart:MinEnd));
    tmp_array=[cuLevel;abs(MaxVal-MinVal)];ecap32_array=[ecap32_array tmp_array];
    %moving average ECAP1 signal
    [MaxVal,MaxIdx]=max(filter_ecapICA32(MaxStart:MaxEnd));
    [MinVal,MinIdx]=min(filter_ecapICA32(MinStart:MinEnd));
    tmp_array=[cuLevel; abs(MaxVal-MinVal)];filter_ecapICA32_array=[filter_ecapICA32_array tmp_array]; 
    
    %moving average ecap_avg singal for 64 avg
    [MaxVal,MaxIdx]=max(ecap64(MaxStart:MaxEnd));
    [MinVal,MinIdx]=min(ecap64(MinStart:MinEnd));
    tmp_array=[cuLevel;abs(MaxVal-MinVal)];ecap64_array=[ecap64_array tmp_array];
    %moving average ECAP1 signal
    [MaxVal,MaxIdx]=max(filter_ecapICA64(MaxStart:MaxEnd));
    [MinVal,MinIdx]=min(filter_ecapICA64(MinStart:MinEnd));
    tmp_array=[cuLevel; abs(MaxVal-MinVal)];filter_ecapICA64_array=[filter_ecapICA64_array tmp_array]; 
    
    %-----test code---
    
    
end
ecap128=[data(10).ecap128 data(11).ecap128 data(12).ecap128 data(13).ecap128 data(14).ecap128 data(15).ecap128];
ecapICA32=[data(10).ecapICA32 data(11).ecapICA32 data(12).ecapICA32 data(13).ecapICA32 data(14).ecapICA32 data(15).ecapICA32];

S32=[];
S32_tmp=[data(10).ST0Avg32-data(10).ST2Avg32;data(10).ST1Avg32-data(10).ST2Avg32];S32=[S32 S32_tmp];
S32_tmp=[data(11).ST0Avg32-data(11).ST2Avg32;data(11).ST1Avg32-data(11).ST2Avg32];S32=[S32 S32_tmp];
S32_tmp=[data(12).ST0Avg32-data(12).ST2Avg32;data(12).ST1Avg32-data(12).ST2Avg32];S32=[S32 S32_tmp];
S32_tmp=[data(13).ST0Avg32-data(13).ST2Avg32;data(13).ST1Avg32-data(13).ST2Avg32];S32=[S32 S32_tmp];
S32_tmp=[data(14).ST0Avg32-data(14).ST2Avg32;data(14).ST1Avg32-data(14).ST2Avg32];S32=[S32 S32_tmp];
S32_tmp=[data(15).ST0Avg32-data(15).ST2Avg32;data(15).ST1Avg32-data(15).ST2Avg32];S32=[S32 S32_tmp];


Y32=icalab3_algo(S32,algo);
[ECAPc ECAPa]=icalab3_pinv(S32,Y32);    
combine6_ecapICA32=0.5*(ECAPc+ECAPa);
%plot 6 combine signal ecap128 ica 
%figure;hold all;plot(ecap128);plot(ecapICA32);plot(combine6_ecapICA32);
ecap_c=S32(1,:)-Y32(1,:);ecap_a=S32(2,:)-Y32(1,:);
noScale_ecapICA32=0.5*(ecap_c+ecap_a)*0.2;
%plot(-1*noScale_ecapICA32);
%legend ('AP 128 samples ECAP','original 32 samples ICA ECAP','combine 32 samples ICA ECAP','combine 32 samples ICA ECAP non-scale');
%str=[algo '  cuLevel 10~15 '];
%title(str);

Fs = 56000;                    % Sampling frequency
T = 1/Fs;                     % Sample time
L = 111;                     % Length of signal
t = (0:L-1)*T;                % Time vector
x=data(10).ecapICA32;
NFFT = 2^nextpow2(L); % Next power of 2 from length of y
Y = fft(x,NFFT)/L;
f = Fs/2*linspace(0,1,NFFT/2+1);

% Plot ecapICA32 freq domain  cuLevel=11~15
figure; hold all;
plot(f,2*abs(Y(1:NFFT/2+1))) 
title('Single-Sided Amplitude Spectrum of y(t)')
xlabel('Frequency (Hz)')
ylabel('|Y(f)|')

x=data(11).ecapICA32;Y = fft(x,NFFT)/L;plot(f,2*abs(Y(1:NFFT/2+1)));
x=data(12).ecapICA32;Y = fft(x,NFFT)/L;plot(f,2*abs(Y(1:NFFT/2+1)));
x=data(13).ecapICA32;Y = fft(x,NFFT)/L;plot(f,2*abs(Y(1:NFFT/2+1)));
x=data(14).ecapICA32;Y = fft(x,NFFT)/L;plot(f,2*abs(Y(1:NFFT/2+1)));
x=data(15).ecapICA32;Y = fft(x,NFFT)/L;plot(f,2*abs(Y(1:NFFT/2+1)));
%--------------test signal freq-domain---------------------------
%x=[data(11).ARTIFACTc_sub ; data(11).ARTIFACTa_sub];
%x_2=[data(11).ARTIFACTc; data(11).ARTIFACTa];
%figure; hold all;
%Y = fft(x(1,:),NFFT)/L;plot(f,2*abs(Y(1:NFFT/2+1)));
%Y = fft(x(2,:),NFFT)/L;plot(f,2*abs(Y(1:NFFT/2+1)));
%---------------------------------------------
figure;hold all;
x=data(1).ARTIFACTc;Y = fft(x(1,:),NFFT)/L;plot(f,2*abs(Y(1:NFFT/2+1)));
x=data(2).ARTIFACTc;Y = fft(x(1,:),NFFT)/L;plot(f,2*abs(Y(1:NFFT/2+1)));
x=data(3).ARTIFACTc;Y = fft(x(1,:),NFFT)/L;plot(f,2*abs(Y(1:NFFT/2+1)));
x=data(4).ARTIFACTc;Y = fft(x(1,:),NFFT)/L;plot(f,2*abs(Y(1:NFFT/2+1)));
x=data(5).ARTIFACTc;Y = fft(x(1,:),NFFT)/L;plot(f,2*abs(Y(1:NFFT/2+1)));
figure; hold all;
x=data(6).ARTIFACTc;Y = fft(x(1,:),NFFT)/L;plot(f,2*abs(Y(1:NFFT/2+1)));
x=data(7).ARTIFACTc;Y = fft(x(1,:),NFFT)/L;plot(f,2*abs(Y(1:NFFT/2+1)));
x=data(8).ARTIFACTc;Y = fft(x(1,:),NFFT)/L;plot(f,2*abs(Y(1:NFFT/2+1)));
x=data(9).ARTIFACTc;Y = fft(x(1,:),NFFT)/L;plot(f,2*abs(Y(1:NFFT/2+1)));
x=data(10).ARTIFACTc;Y = fft(x(1,:),NFFT)/L;plot(f,2*abs(Y(1:NFFT/2+1)));
x=data(11).ARTIFACTc;Y = fft(x(1,:),NFFT)/L;plot(f,2*abs(Y(1:NFFT/2+1)));
x=data(12).ARTIFACTc;Y = fft(x(1,:),NFFT)/L;plot(f,2*abs(Y(1:NFFT/2+1)));
x=data(13).ARTIFACTc;Y = fft(x(1,:),NFFT)/L;plot(f,2*abs(Y(1:NFFT/2+1)));
x=data(14).ARTIFACTc;Y = fft(x(1,:),NFFT)/L;plot(f,2*abs(Y(1:NFFT/2+1)));
x=data(15).ARTIFACTc;Y = fft(x(1,:),NFFT)/L;plot(f,2*abs(Y(1:NFFT/2+1)));
%----------------------------------------------
%-----------------------------------------------
figure; hold all;
plot(data(1).ARTIFACTc);
plot(data(2).ARTIFACTc);
plot(data(3).ARTIFACTc);
plot(data(4).ARTIFACTc);
plot(data(5).ARTIFACTc);
figure; hold all;
plot(data(6).ARTIFACTc);
plot(data(7).ARTIFACTc);
plot(data(8).ARTIFACTc);
plot(data(9).ARTIFACTc);
plot(data(10).ARTIFACTc);
plot(data(11).ARTIFACTc);
plot(data(12).ARTIFACTc);
plot(data(13).ARTIFACTc);
plot(data(14).ARTIFACTc);
plot(data(15).ARTIFACTc);
%------------------------------------------
figure;hold all;
x=data(1).ARTIFACTc_sub;Y = fft(x(1,:),NFFT)/L;plot(f,2*abs(Y(1:NFFT/2+1)));
x=data(2).ARTIFACTc_sub;Y = fft(x(1,:),NFFT)/L;plot(f,2*abs(Y(1:NFFT/2+1)));
x=data(3).ARTIFACTc_sub;Y = fft(x(1,:),NFFT)/L;plot(f,2*abs(Y(1:NFFT/2+1)));
x=data(4).ARTIFACTc_sub;Y = fft(x(1,:),NFFT)/L;plot(f,2*abs(Y(1:NFFT/2+1)));
x=data(5).ARTIFACTc_sub;Y = fft(x(1,:),NFFT)/L;plot(f,2*abs(Y(1:NFFT/2+1)));
x=data(6).ARTIFACTc_sub;Y = fft(x(1,:),NFFT)/L;plot(f,2*abs(Y(1:NFFT/2+1)));
x=data(7).ARTIFACTc_sub;Y = fft(x(1,:),NFFT)/L;plot(f,2*abs(Y(1:NFFT/2+1)));
x=data(8).ARTIFACTc_sub;Y = fft(x(1,:),NFFT)/L;plot(f,2*abs(Y(1:NFFT/2+1)));
x=data(9).ARTIFACTc_sub;Y = fft(x(1,:),NFFT)/L;plot(f,2*abs(Y(1:NFFT/2+1)));
x=data(10).ARTIFACTc_sub;Y = fft(x(1,:),NFFT)/L;plot(f,2*abs(Y(1:NFFT/2+1)));
x=data(11).ARTIFACTc_sub;Y = fft(x(1,:),NFFT)/L;plot(f,2*abs(Y(1:NFFT/2+1)));
x=data(12).ARTIFACTc_sub;Y = fft(x(1,:),NFFT)/L;plot(f,2*abs(Y(1:NFFT/2+1)));
x=data(13).ARTIFACTc_sub;Y = fft(x(1,:),NFFT)/L;plot(f,2*abs(Y(1:NFFT/2+1)));
x=data(14).ARTIFACTc_sub;Y = fft(x(1,:),NFFT)/L;plot(f,2*abs(Y(1:NFFT/2+1)));
x=data(15).ARTIFACTc_sub;Y = fft(x(1,:),NFFT)/L;plot(f,2*abs(Y(1:NFFT/2+1)));
%----------------------------------------------
%-----------------------------------------------
figure; hold all;
plot(data(1).ARTIFACTc_sub);
plot(data(2).ARTIFACTc_sub);
plot(data(3).ARTIFACTc_sub);
plot(data(4).ARTIFACTc_sub);
plot(data(5).ARTIFACTc_sub);
plot(data(6).ARTIFACTc_sub);
plot(data(7).ARTIFACTc_sub);
plot(data(8).ARTIFACTc_sub);
plot(data(9).ARTIFACTc_sub);
plot(data(10).ARTIFACTc_sub);
plot(data(11).ARTIFACTc_sub);
plot(data(12).ARTIFACTc_sub);
plot(data(13).ARTIFACTc_sub);
plot(data(14).ARTIFACTc_sub);
plot(data(15).ARTIFACTc_sub);
%------------------------------------------


