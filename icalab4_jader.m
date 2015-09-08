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
for i=15:length(data)
    ecap32=data(i).ecap32;
    ecap64=data(i).ecap64;
    ecap128=data(i).ecap128; 
    ecap256=data(i).ecap256;
    cuLevel=data(i).cuLevel;
    
%    [b, a]=butter(filter_order, cut_freq/(fs/2), 'low');
%    data(i).ST0Avg32=filter(b,a,data(i).ST0Avg32);
%    data(i).ST1Avg32=filter(b,a,data(i).ST1Avg32);
%    data(i).ST2Avg32=filter(b,a,data(i).ST2Avg64);
%    data(i).ST0Avg64=filter(b,a,data(i).ST0Avg64);
%    data(i).ST1Avg64=filter(b,a,data(i).ST1Avg64);
%    data(i).ST2Avg64=filter(b,a,data(i).ST2Avg64);
    
    
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

end


S32_tmp=S32;
for i=1:12 S32=[S32 S32_tmp]; end
S32_4i=S32;

Y32_1=ica_f(S32',1332,56000);
Y32_2=ica_f(-1*S32',1332,56000);
S32(1,:)=-1*S32(1,:);
S32_4i=[S32_4i;S32];
Y32_3=ica_f(S32',1332,56000);
Y32_4=ica_f(-1*S32',1332,56000);
Y32_4o=ica_f(S32_4i',1332,56000);
plotc2(Y32_1(1,1:111),Y32_1(2,1:111));
plotc2(Y32_2(1,1:111),Y32_2(2,1:111));
plotc2(Y32_3(1,1:111),Y32_3(2,1:111));
plotc2(Y32_4(1,1:111),Y32_4(2,1:111));

figure;hold all;
plot(Y32_4o(1,1:111));plot(Y32_4o(2,1:111));

S=[S32(1,1:111);S32(2,1:111)];
Y=[Y32_3(1,1:111);Y32_1(1,1:111)];

[ECAPc ECAPa]=icalab3_pinv(S,Y);    
ecapICA32=-0.5*(ECAPc-ECAPa);
%plotc2(ecapICA32,ecap128);

ARTIFACTc_sub=S(1,:)-ecapICA32;
ARTIFACTa_sub=S(2,:)-ecapICA32;




Y32=1;

