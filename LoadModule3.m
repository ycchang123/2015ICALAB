function data=LoadModule3(src_dir)

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
    data(i).ST0Avg50=ECAPdata.AVG_ST0;
    data(i).ST1Avg50=ECAPdata.AVG_ST1;
    data(i).ST2Avg50=ECAPdata.AVG_ST2;

    
    data(i).ecap32=0.5*(data(i).ST0Avg32+data(i).ST1Avg32-2*data(i).ST2Avg32);  
    data(i).ecap50=0.5*(data(i).ST0Avg50+data(i).ST1Avg50-2*data(i).ST2Avg50);  

    data(i).cuLevel=ECAPdata.ExpVars.I * ECAPdata.Measurement.PhaseDurationUs*K;
    i=i+1;
end
fclose(fid);
