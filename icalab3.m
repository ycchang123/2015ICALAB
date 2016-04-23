function  data=icalab3(src_dir,algo,filter_order,cut_freq)
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
    
    S32=[data(i).ST0Avg32-data(i).ST2Avg32;data(i).ST1Avg32-data(i).ST2Avg32];
    Y32=icalab3_algo(S32,algo);
    [ECAPc ECAPa]=icalab3_pinv(S32,Y32);    
    ecapICA32=0.5*(ECAPc+ECAPa);
    data(i).ecapICA32=ecapICA32;
    
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
    

    [b, a]=butter(filter_order, cut_freq/(fs/2), 'low');
    %[b, a]=cheby1(filter_order, 0.5,cut_freq/(fs/2), 'low');
    %filter_ecap32=filter(b,a,ecap32);
    filter_ecapICA32=filter(b,a,ecapICA32);
    data(i).ecap32=ecap32;data(i).filter_ecapICA32=filter_ecapICA32;

    %filter_ecap64=filter(b,a,ecap64);
    filter_ecapICA64=filter(b,a,ecapICA64);
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
i=1;
while ecap128_array(2,i)<0.15,i=i+1; end
point_threshold=i-1;
%利用回歸計算出least square
%計算ecap128 threshold
p_ecap128=polyfit(ecap128_array(1,point_threshold:end),ecap128_array(2,point_threshold:end),1);
ecap128_threshold=-1*p_ecap128(2)/p_ecap128(1);
%caculate ecap256 threshold
p_ecap256=polyfit(ecap256_array(1,point_threshold:end),ecap256_array(2,point_threshold:end),1);
ecap256_threshold=-1*p_ecap256(2)/p_ecap256(1);
% LPF from ecap32 and ecapICA32
p_ecap32=polyfit(ecap32_array(1,point_threshold:end),ecap32_array(2,point_threshold:end),1);
p_filter_ecapICA32=polyfit(filter_ecapICA32_array(1,point_threshold:end),filter_ecapICA32_array(2,point_threshold:end),1);
ecap32_threshold=-1*p_ecap32(2)/p_ecap32(1);
filter_ecapICA32_threshold=-1*p_filter_ecapICA32(2)/p_filter_ecapICA32(1);
%LPF from ecap64 and ecapICA64
p_ecap64=polyfit(ecap64_array(1,point_threshold:end),ecap64_array(2,point_threshold:end),1);
p_filter_ecapICA64=polyfit(filter_ecapICA64_array(1,point_threshold:end),filter_ecapICA64_array(2,point_threshold:end),1);
ecap64_threshold=-1*p_ecap64(2)/p_ecap64(1);
filter_ecapICA64_threshold=-1*p_filter_ecapICA64(2)/p_filter_ecapICA64(1);

data(1).ecap128Threshold=ecap128_threshold;
data(1).ecap256Threshold=ecap256_threshold;
data(1).ecap32Threshold=ecap32_threshold;data(1).ecapICA32Threshold=filter_ecapICA32_threshold;
data(1).ecap64Threshold=ecap64_threshold;data(1).ecapICA64Threshold=filter_ecapICA64_threshold;
data(1).ecap32_array=ecap32_array;data(1).ecap64_array=ecap64_array;
data(1).ecap128_array=ecap128_array;data(1).ecap256_array=ecap256_array;
data(1).filter_ecapICA32_array=filter_ecapICA32_array;data(1).filter_ecapICA64_array=filter_ecapICA64_array;
