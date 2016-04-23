function rdata=icalab5(src_dir)
%src_dir='src42v2\'
FreqList=[10000,11000,12000,13000,14000,15000,16000,17000,18000,19000,20000,21000,22000,23000,24000,25000, 26000, 27000 ];
AlgoList={'ngfica' 'amuse' 'jadeop' 'fjade' 'sobi' 'erica' 'powerica' 'symwhite' 'multicombi' 'fajdc4' 'qjade' 'jadetd' 'ewasobi' 'wasobi' 'thinica' 'evd2'};
fs=56000;
filter_order=10;
%MaxStart=31;MaxEnd=60;MinStart=11;MinEnd=30;
data=LoadModule2(src_dir);
%rdata=zeros(length(AlgoList),length(FreqList),length(data));
for i=1:length(AlgoList)
    algo=char(AlgoList(i));
    for j=1:length(FreqList)+2
        if j <= length(FreqList)
            cutoff=FreqList(j);
            [b, a]=butter(filter_order, cutoff/(fs/2), 'low');
        end
        for k=1:length(data)
            rdata(i,j,k).ecap32=data(k).ecap32;
            rdata(i,j,k).ecap64=data(k).ecap64;
            rdata(i,j,k).ecap128=data(k).ecap128;
            rdata(i,j,k).ecap256=data(k).ecap256;
            rdata(i,j,k).cuLevel=data(k).cuLevel;
            
            %ISL
            S32=[data(k).ST0Avg32-data(k).ST2Avg32;data(k).ST1Avg32-data(k).ST2Avg32];
            I32=icalab3_algo(S32,algo);            
            [ECAPc ECAPa]=icalab3_pinv(S32,I32);    
            IS32=0.5*(ECAPc+ECAPa);
            if j > length(FreqList)
                ISL32=movavg(IS32,j-length(FreqList)+1);
            else
                ISL32=filter(b,a,IS32);
            end
            
            S64=[data(k).ST0Avg64-data(k).ST2Avg64;data(k).ST1Avg64-data(k).ST2Avg64];
            I64=icalab3_algo(S64,algo);           
            [ECAPc ECAPa]=icalab3_pinv(S64,I64);    
            IS64=0.5*(ECAPc+ECAPa);
            if j > length(FreqList)
                ISL64=movavg(IS64,j-length(FreqList)+1);
            else
                ISL64=filter(b,a,IS64);
            end           
            rdata(i,j,k).ISL32=ISL32;rdata(i,j,k).ISL64=ISL64;
            %IS
            rdata(i,j,k).IS32=IS32;rdata(i,j,k).IS64=IS64;
            
            %LIS
            if j > length(FreqList)
                ST0Avg32=movavg(data(k).ST0Avg32,j-length(FreqList)+1);
                ST1Avg32=movavg(data(k).ST1Avg32,j-length(FreqList)+1);
                ST2Avg32=movavg(data(k).ST2Avg64,j-length(FreqList)+1);
                ST0Avg64=movavg(data(k).ST0Avg64,j-length(FreqList)+1);
                ST1Avg64=movavg(data(k).ST1Avg64,j-length(FreqList)+1);
                ST2Avg64=movavg(data(k).ST2Avg64,j-length(FreqList)+1);
                
            else
                ST0Avg32=filter(b,a,data(k).ST0Avg32);
                ST1Avg32=filter(b,a,data(k).ST1Avg32);
                ST2Avg32=filter(b,a,data(k).ST2Avg64);
                ST0Avg64=filter(b,a,data(k).ST0Avg64);
                ST1Avg64=filter(b,a,data(k).ST1Avg64);
                ST2Avg64=filter(b,a,data(k).ST2Avg64);
            end
            
            L32=[ST0Avg32-ST2Avg32;ST1Avg32-ST2Avg32];
            LI32=icalab3_algo(L32,algo);
            [ECAPc ECAPa]=icalab3_pinv(L32,LI32);    
            LIS32=0.5*(ECAPc+ECAPa);
    
            L64=[ST0Avg64-ST2Avg64;ST1Avg64-ST2Avg64];
            LI64=icalab3_algo(L64,algo);
            [ECAPc ECAPa]=icalab3_pinv(L64,LI64);    
            LIS64=0.5*(ECAPc+ECAPa);
            rdata(i,j,k).LIS32=LIS32;rdata(i,j,k).LIS64=LIS64;
            
            %ILS
            if j > length(FreqList)
                IL32(1,:)=movavg(I32(1,:),j-length(FreqList)+1);
                IL32(2,:)=movavg(I32(2,:),j-length(FreqList)+1);
            else
                IL32(1,:)=filter(b,a,I32(1,:));
                IL32(2,:)=filter(b,a,I32(2,:));
            end
            [ECAPc ECAPa]=icalab3_pinv(S32,IL32);
            ILS32=0.5*(ECAPc+ECAPa);

            if j > length(FreqList)
                IL64(1,:)=movavg(I64(1,:),j-length(FreqList)+1);
                IL64(2,:)=movavg(I64(2,:),j-length(FreqList)+1);
            else
                IL64(1,:)=filter(b,a,I64(1,:));
                IL64(2,:)=filter(b,a,I64(2,:));
            end
            [ECAPc ECAPa]=icalab3_pinv(S64,IL64);
            ILS64=0.5*(ECAPc+ECAPa);
            rdata(i,j,k).ILS32=ILS32;rdata(i,j,k).ILS64=ILS64;
        end
    end
end

