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


%---------------------------------------------

%----------------------------------------------
%-----------------------------------------------

%------------------------------------------

%----------------------------------------------
%-----------------------------------------------

%------------------------------------------

fid =fopen('report.txt','w');
fprintf(fid,'\nNO      ');
for i=1:15
    fprintf(fid,' %d\t\t',i);
end
fprintf(fid,'\nCuLevel ');
for i=1:15
    fprintf(fid,' %3.2f\t',data(i).cuLevel);
end
fprintf(fid,'\nhigh    ');
for i=1:15
    fprintf(fid,' %3.2f\t',data(i).ARTIFACTc_sub(14));
end
fprintf(fid,'\nlow     ');
for i=1:15
    fprintf(fid,' %3.2f\t',data(i).ARTIFACTc_sub(16));
end
fprintf(fid,'\ndiff    ');
for i=1:15
    fprintf(fid,' %3.2f\t',abs(data(i).ARTIFACTc_sub(16)-data(i).ARTIFACTc_sub(14)));
end
fprintf(fid,'\necap128 ');
for i=1:15
    fprintf(fid,' %3.2f\t',ecap128_array(2,i));
end
fprintf(fid,'\necap32  ');
for i=1:15
    fprintf(fid,' %3.2f\t',ecap32_array(2,i));
end
fclose(fid);


