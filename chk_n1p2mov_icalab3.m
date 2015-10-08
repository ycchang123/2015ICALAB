% check n1p2 value in data2 
%const electrode and cuLevel 
%load data2.mat;
fid =fopen('report.txt','w');
%pos=0.1;
FreqList=[10000,11000,12000,13000,14000,15000,16000,17000,18000,19000,20000,21000,22000,23000,24000,25000 26000 27000];
AlgoList={'ngfica' 'amuse' 'jadeop' 'fjade' 'sobi' 'erica' 'powerica' 'symwhite' 'multicombi' 'fajdc4' 'qjade' 'jadetd' 'ewasobi' 'wasobi' 'thinica' 'evd2'};
cuLevel=15; %masy some dataset Max culLevel not equal 15

ecap128=data2(1,1).data(cuLevel).ecap128;
ecap32=data2(1,1).data(cuLevel).ecap32;
ecap64=data2(1,1).data(cuLevel).ecap64;
n1p2_ecap128=val_n1p2(ecap128);
n1p2_ecap32=val_n1p2(ecap32);
n1p2_ecap64=val_n1p2(ecap64);
pos=abs(n1p2_ecap128-n1p2_ecap32);
fprintf(fid,'ECAP Avg128 N1-P2 value=%3.4f\n',n1p2_ecap128);
fprintf(fid,'ECAP Avg32 N1-P2 value=%3.4f\n',n1p2_ecap32);
fprintf(fid,'ECAP Avg128 Avg32 different value=%3.4f\n',pos);

for i=1:length(AlgoList)
    fprintf(fid,'%s algorithm \n',char(AlgoList(i)));
    print_signal=0;
    for j=1:length(FreqList)      
        filter_ecapICA32=data2(i,j).data(cuLevel).filter_ecapICA32;
        n1p2_filter_ecapICA32=val_n1p2(filter_ecapICA32);
        if (abs(n1p2_filter_ecapICA32-n1p2_ecap128)<pos)
            if print_signal==0 fprintf(fid,'32 avg\t'); end
            fprintf(fid,'%d=>%3.2f\t',FreqList(j),n1p2_filter_ecapICA32);
            print_signal=1;
        end      
    end
    for mov_factor=2:7
        ecapICA32=data2(i,j).data(cuLevel).ecapICA32;
        mov_ecapICA32=movavg(ecapICA32,mov_factor);
        n1p2_mov_ecapICA32=val_n1p2(mov_ecapICA32);
        if (abs(n1p2_mov_ecapICA32-n1p2_ecap128)<pos)
            if print_signal==0 fprintf(fid,'32 avg\t'); end
            fprintf(fid,'factor %d=>%3.2f\t',mov_factor,n1p2_mov_ecapICA32);
            print_signal=1;
        end
    end
    
     if print_signal==1 fprintf(fid,'\n');end

    print_signal=0;
    for j=1:length(FreqList)      
        filter_ecapICA64=data2(i,j).data(cuLevel).filter_ecapICA64;
        n1p2_filter_ecapICA64=val_n1p2(filter_ecapICA64);
        if (abs(n1p2_filter_ecapICA64-n1p2_ecap128)<pos)
            if print_signal==0 fprintf(fid,'64 avg\t'); end
            fprintf(fid,'%d=>%3.2f\t',FreqList(j),n1p2_filter_ecapICA64);
            print_signal=1;
        end      
    end
    for mov_factor=2:7
        ecapICA64=data2(i,j).data(cuLevel).ecapICA64;
        mov_ecapICA64=movavg(ecapICA64,mov_factor);
        n1p2_mov_ecapICA64=val_n1p2(mov_ecapICA64);
        if (abs(n1p2_mov_ecapICA64-n1p2_ecap128)<pos)
            if print_signal==0 fprintf(fid,'64 avg\t'); end
            fprintf(fid,'factor %d=>%3.2f\t',mov_factor,n1p2_mov_ecapICA64);
            print_signal=1;
        end
    end

%     print_signal=0;
%     for j=1:length(FreqList)      
%        if (abs(data2(i,j).ecapICA64Threshold-ecapSTDThreshold)<pos)
%            if print_signal==0 fprintf(fid,'64 avg\t'); end
%            fprintf(fid,'%d=>%3.2f\t',FreqList(j),data2(i,j).ecapICA64Threshold);
%            print_signal=1;
%        end      
%    end
    if print_signal==1 fprintf(fid,'\n');end  
end
fclose(fid);