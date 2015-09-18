clear;
load data2.mat;
%qjade cutfreq=13k (11,4),  erica 13k (6,4)
figure;hold all;
plot(data2(11,4).data(15).ecap32);
plot(data2(11,4).data(15).ecapICA32);
plot(data2(11,4).data(15).filter_ecapICA32);
[b,a]=butter(10,1/(56000/2),'high');
filter_ecapICA32=filter(b,a,data2(11,4).data(15).ecapICA32);
plot(filter_ecapICA32);
hpf_filter_ecapICA32=filter(b,a,filter_ecapICA32);
plot(hpf_filter_ecapICA32);
legend ('AP ecap','ICALAB ecap ','LPF ICALAB ecap 13K','1 Hz HPF ICA ecap','BPF 1Hz 13K ICA ecap');
figure; hold all;
[x,y]=fft_icalab3(data2(11,4).data(15).ecap32);plot(x,y);
[x,y]=fft_icalab3(data2(11,4).data(15).ecapICA32);plot(x,y);
[x,y]=fft_icalab3(data2(11,4).data(15).filter_ecapICA32);plot(x,y)
[x,y]=fft_icalab3(filter_ecapICA32);plot(x,y);
[x,y]=fft_icalab3(hpf_filter_ecapICA32);plot(x,y);
title ('ecap spectrum')
legend ('AP ecap','ICALAB ecap','LPF ICALAB ecap cutoff freq=13k','1 Hz HPF ecap','BPF 1Hz 13K ICA ecap');
%figure; hold all;
%plot(data2(6,4).data(15).ecap32);
%plot(data2(6,4).data(15).ecapICA32);
%plot(data2(6,4).data(15).filter_ecapICA32);
%legend ('AP ecap','ICALAB ecap ','LPF ICALAB ecap');



