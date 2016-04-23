
pos=1;
FreqList=[10000,11000,12000,13000,14000,15000,16000,17000,18000,19000,20000,21000,22000,23000,24000,25000 26000 27000];
AlgoList={'ngfica' 'amuse' 'jadeop' 'fjade' 'sobi' 'erica' 'powerica' 'symwhite' 'multicombi' 'fajdc4' 'qjade' 'jadetd' 'ewasobi' 'wasobi' 'thinica' 'evd2'};
ecap32Threshold=data2(1,1).ecap32Threshold;
ecap64Threshold=data2(1,1).ecap64Threshold;
ecap128Threshold=data2(1,1).ecap128Threshold;
ecap256Threshold=data2(1,1).ecap256Threshold;
figure;hold all;

if ecap256Threshold==0 
    ecapSTDThreshold=ecap128Threshold; 
else
    ecapSTDThreshold=ecap256Threshold;
end
ecapSTDThreshold=ecap128Threshold;

for i=1:length(AlgoList)
    print_signal=0;
    for j=1:length(FreqList)      
        if (abs(data2(i,j).ecapICA32Threshold-ecapSTDThreshold)<pos)
            plot(j,i,'black:o');
            set(gca, 'ytick', [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18]);
            set(gca, 'yticklabel',AlgoList);
            set(gca, 'xtick', [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18]);
            set(gca, 'xticklabel',FreqList);
            
            print_signal=1;
        end      
    end
end
figure; hold all;
x=[10000:27000];
y=[];
for j=1:length(FreqList)
    y = [y abs(data2(11,j).ecapICA32Threshold-ecapSTDThreshold)];
end
%plot(x,y);


