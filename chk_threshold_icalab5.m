
fid =fopen('report.txt','w');
pos=0.5;
FreqList=[10000,11000,12000,13000,14000,15000,16000,17000,18000,19000,20000,21000,22000,23000,24000,25000 26000 27000];
AlgoList={'ngfica' 'amuse' 'jadeop' 'fjade' 'sobi' 'erica' 'powerica' 'symwhite' 'multicombi' 'fajdc4' 'qjade' 'jadetd' 'ewasobi' 'wasobi' 'thinica' 'evd2'};
length_freqlist=length(FreqList);
signal_class='ils32';

ecap32Threshold=ecap_threshold(1,1,rdata,'ecap32');
ecap64Threshold=ecap_threshold(1,1,rdata,'ecap64');
ecap128Threshold=ecap_threshold(1,1,rdata,'ecap128');
ecap256Threshold=ecap_threshold(1,1,rdata,'ecap256');
fprintf(fid,'ECAP Avg32 Threshold=%3.2f\n',ecap32Threshold);
fprintf(fid,'ECAP Avg64 Threshold=%3.2f\n',ecap64Threshold);
fprintf(fid,'ECAP Avg128 Threshold=%3.2f\n',ecap128Threshold);
fprintf(fid,'ECAP Avg256 Threshold=%3.2f\n',ecap256Threshold);
ecapSTDThreshold=ecap128Threshold;
for i=1:length(AlgoList)
    fprintf(fid,'%s algorithm \n',char(AlgoList(i)));
    print_signal=0;
    for j=1:length(FreqList)      
        if (abs(ecap_threshold(i,j,rdata,signal_class)-ecapSTDThreshold)<pos)
            if print_signal==0 fprintf(fid,'32 avg\t'); end
            fprintf(fid,'%d=>%3.2f\t',FreqList(j),ecap_threshold(i,j,rdata,signal_class));
            print_signal=1;
        end      
    end
     if print_signal==1 fprintf(fid,'\n');end
     
     print_signal=0;
     for j=length_freqlist+1:length_freqlist+2
         if (abs(ecap_threshold(i,j,rdata,signal_class)-ecapSTDThreshold)<pos)
             if print_signal==0 fprintf(fid,'moving average\t'); end
             fprintf(fid,'%d=>%3.2f\t',j,ecap_threshold(i,j,rdata,signal_class));
             print_signal=1;
         end
     end
     if print_signal==1 fprintf(fid,'\n');end
     %print_signal=0;
     %for j=1:length(FreqList)      
     %   if (abs(data2(i,j).ecapICA64Threshold-ecapSTDThreshold)<pos)
     %       if print_signal==0 fprintf(fid,'64 avg\t'); end
     %       fprintf(fid,'%d=>%3.2f\t',FreqList(j),data2(i,j).ecapICA64Threshold);
     %       print_signal=1;
     %   end      
     %end
    %if print_signal==1 fprintf(fid,'\n');end  
end
fclose(fid);