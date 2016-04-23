
pos=1;
FreqList=[10000,11000,12000,13000,14000,15000,16000,17000,18000,19000,20000,21000,22000,23000,24000,25000 26000 27000];
AlgoList={'ngfica' 'amuse' 'jadeop' 'fjade' 'sobi' 'erica' 'powerica' 'symwhite' 'multicombi' 'fajdc4' 'qjade' 'jadetd' 'ewasobi' 'wasobi' 'thinica' 'evd2'};
figure(1);hold all;

ecapSTDThreshold=data2(1,1).ecap128Threshold;
x=1:length(FreqList);y=zeros(16,18);
for i=1:length(AlgoList)
    for j=1:length(FreqList)
        y(i,j)=abs(data2(i,j).ecapICA32Threshold-ecapSTDThreshold);        
    end
end
set(gca,'xtick',[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18]);
set(gca,'xticklabel',[10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27]);
plot(x,y(1,:));
plot(x,y(4,:));
plot(x,y(12,:));
plot(x,y(15,:));
plot(x,y(16,:));
legend('ngfica','fjade','jadetd','thinica','evd2');
axis([0 18 0 30]);
xlabel('cutoff Frequecy (K)');
ylabel('|Avg 32 ICALAB ECAP treshhold-Avg128 AP Threashold|');
title('differen from ICALAB Avg 32 ECAP and Avg 128 AP threshold ');

figure(2);hold all;
x1=[0,18];y1=[ecapSTDThreshold,ecapSTDThreshold];
plot(x1,y1,'k');
text(1,135,'Avg 128 AP threshold=127.92')
for j=1:length(FreqList)
    y1(1,j)=data2(1,j).ecapICA32Threshold;
    y1(2,j)=data2(4,j).ecapICA32Threshold;
    y1(3,j)=data2(12,j).ecapICA32Threshold;
    y1(4,j)=data2(15,j).ecapICA32Threshold;
    y1(5,j)=data2(16,j).ecapICA32Threshold;
end
set(gca,'xtick',[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18]);
set(gca,'xticklabel',[10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27]);
plot(x,y1);
legend('ngfica','fjade','jadetd','thinica','evd2');
axis([0 18 100 160]);
xlabel('cutoff Frequecy (K)');
ylabel('Avg 32 ICALAB ECAP treshhold');
title('ICALAB Avg 32 ECAP threshold')