clear all;
load data3t.mat;
data3_srct=data3_src89t; %modify this variable

data2=[];
for i=1:16
    for j=1:18
        sum_ecapICA32Threshold=0;sum_ecapICA64Threshold=0;
        for k=1:128
            sum_ecapICA32Threshold=sum_ecapICA32Threshold+data3_srct(k).data2(i,j).ecapICA32Threshold;
            sum_ecapICA64Threshold=sum_ecapICA64Threshold+data3_srct(k).data2(i,j).ecapICA64Threshold;
        end
       data2(i,j).ecapICA32Threshold=sum_ecapICA32Threshold/128;
       data2(i,j).ecapICA64Threshold=sum_ecapICA64Threshold/128;
       
    end
end
data2(1,1).ecap32Threshold=data3_srct(1).data2(1,1).ecap32Threshold;
data2(1,1).ecap64Threshold=data3_srct(1).data2(1,1).ecap64Threshold;
data2(1,1).ecap128Threshold=data3_srct(1).data2(1,1).ecap128Threshold;
data2(1,1).ecap256Threshold=data3_srct(1).data2(1,1).ecap256Threshold;

chk_icalab3;
