clear;
load data2.mat;
%qjade cutfreq=13k (11,4),  erica 13k (6,4)
figure;hold all;
plot(data2(11,4).data(15).ecap32);
plot(data2(11,4).data(15).ecapICA32);
plot(data2(11,4).data(15).filter_ecapICA32);
[b,a]=butter(10,1/(56000/2),'high');
filter_ecap32=filter(b,a,data2(11,4).data(15).ecapICA32);
plot(filter_ecap32);

figure; hold all;
[x,y]=fft_icalab3(data2(11,4).data(15).ecap32);plot(x,y);
[x,y]=fft_icalab3(data2(11,4).data(15).ecapICA32);plot(x,y);
[x,y]=fft_icalab3(data2(11,4).data(15).filter_ecapICA32);plot(x,y)


[x,y]=fft_icalab3(filter_ecap32);
plot(x,y);

legend ('AP ecap','ICALAB ecap ','LPF ICALAB ecap');
%figure; hold all;
%plot(data2(6,4).data(15).ecap32);
%plot(data2(6,4).data(15).ecapICA32);
%plot(data2(6,4).data(15).filter_ecapICA32);
%legend ('AP ecap','ICALAB ecap ','LPF ICALAB ecap');



