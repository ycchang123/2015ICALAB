function data=LoadModule1(src_dir)

src_filelist=[src_dir 'filelist.txt'];
fid=fopen(src_filelist);
i=1;
K=0.0128447;
while feof(fid)==0
    filename=fgetl(fid);
    loadfile=sprintf('load %s%s',src_dir,filename);
    eval(loadfile);   
    data(i).ST0Avg32=mean(ECAPdata.SINGLE_ST0(1:32,:));
    data(i).ST1Avg32=mean(ECAPdata.SINGLE_ST1(1:32,:));
    data(i).ST2Avg32=mean(ECAPdata.SINGLE_ST2(1:32,:));
    data(i).ST0Avg64=mean(ECAPdata.SINGLE_ST0(1:64,:));
    data(i).ST1Avg64=mean(ECAPdata.SINGLE_ST1(1:64,:));
    data(i).ST2Avg64=mean(ECAPdata.SINGLE_ST2(1:64,:));
    data(i).ST0Avg128=mean(ECAPdata.SINGLE_ST0(1:128,:));
    data(i).ST1Avg128=mean(ECAPdata.SINGLE_ST1(1:128,:));
    data(i).ST2Avg128=mean(ECAPdata.SINGLE_ST2(1:128,:));
    
    data(i).ecap32=0.5*(data(i).ST0Avg32+data(i).ST1Avg32-2*data(i).ST2Avg32);  
    data(i).ecap64=0.5*(data(i).ST0Avg64+data(i).ST1Avg64-2*data(i).ST2Avg64);  
    data(i).ecap128=0.5*(data(i).ST0Avg128+data(i).ST1Avg128-2*data(i).ST2Avg128);   
    data(i).cuLevel=ECAPdata.ExpVars.I * ECAPdata.Measurement.PhaseDurationUs*K;
    i=i+1;
end
fclose(fid);
