function data2=cf_icalab3_lis(src_dir) 
%src_dir='src42\';
%FreqList=[14000,15000,16000];
FreqList=[10000,11000,12000,13000,14000,15000,16000,17000,18000,19000,20000,21000,22000,23000,24000,25000 26000 27000];
AlgoList={'ngfica' 'amuse' 'jadeop' 'fjade' 'sobi' 'erica' 'powerica' 'symwhite' 'multicombi' 'fajdc4' 'qjade' 'jadetd' 'ewasobi' 'wasobi' 'thinica' 'evd2'};
for i=1:length(AlgoList)
    for j=1:length(FreqList)
        data=icalab3_lis(src_dir,char(AlgoList(i)),10,FreqList(j));
        data2(i,j).data=data;
        data2(i,j).ecapICA32Threshold=data(1).ecapICA32Threshold;
        data2(i,j).ecapICA64Threshold=data(1).ecapICA64Threshold;
    end
end
data2(1,1).ecap256Threshold=data(1).ecap256Threshold;
data2(1,1).ecap128Threshold=data(1).ecap128Threshold;
data2(1,1).ecap32Threshold=data(1).ecap32Threshold;
data2(1,1).ecap64Threshold=data(1).ecap64Threshold;
