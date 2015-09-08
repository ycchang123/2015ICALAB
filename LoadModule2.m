function data=LoadModule2(src_dir)

src_filelist=[src_dir 'filelist.txt'];
fid=fopen(src_filelist);
i=1;
while feof(fid)==0
    filename=fgetl(fid);
    loadfile=sprintf('load %s%s',src_dir,filename);
    eval(loadfile);   
    data(i).ST0Avg32=AVG32_ST0/500;
    data(i).ST1Avg32=AVG32_ST1/500;
    data(i).ST2Avg32=AVG32_ST2/500;
    data(i).ST0Avg64=AVG64_ST0/500;
    data(i).ST1Avg64=AVG64_ST1/500;
    data(i).ST2Avg64=AVG64_ST2/500;
    data(i).ST0Avg128=AVG128_ST0/500;
    data(i).ST1Avg128=AVG128_ST1/500;
    data(i).ST2Avg128=AVG128_ST2/500;
    data(i).ST0Avg256=AVG256_ST0/500;
    data(i).ST1Avg256=AVG256_ST1/500;
    data(i).ST2Avg256=AVG256_ST2/500;
    
    data(i).ecap32=0.5*(data(i).ST0Avg32+data(i).ST1Avg32-2*data(i).ST2Avg32);  
    data(i).ecap64=0.5*(data(i).ST0Avg64+data(i).ST1Avg64-2*data(i).ST2Avg64);  
    data(i).ecap128=0.5*(data(i).ST0Avg128+data(i).ST1Avg128-2*data(i).ST2Avg128);   
    data(i).ecap256=0.5*(data(i).ST0Avg256+data(i).ST1Avg256-2*data(i).ST2Avg256);
    data(i).cuLevel=CU;
    i=i+1;
end
fclose(fid);