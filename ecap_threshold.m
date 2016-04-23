function val_threshold=ecap_threshold(algo_index,cutoff_index,rdata,class)

threshold_array=zeros(2,15);
for i=1:15
    threshold_array(1,i)=rdata(algo_index,cutoff_index,i).cuLevel;
    switch class
        case 'isl32'
            threshold_array(2,i)=val_n1p2(rdata(algo_index,cutoff_index,i).ISL32);
        case 'is32'
            threshold_array(2,i)=val_n1p2(rdata(algo_index,cutoff_index,i).IS32);
        case 'lis32'
            threshold_array(2,i)=val_n1p2(rdata(algo_index,cutoff_index,i).LIS32);
        case 'ils32'
            threshold_array(2,i)=val_n1p2(rdata(algo_index,cutoff_index,i).ILS32);
        case 'ecap32'
            threshold_array(2,i)=val_n1p2(rdata(algo_index,cutoff_index,i).ecap32);
        case 'ecap64'
            threshold_array(2,i)=val_n1p2(rdata(algo_index,cutoff_index,i).ecap64);
        case 'ecap128'
            threshold_array(2,i)=val_n1p2(rdata(algo_index,cutoff_index,i).ecap128);
        case 'ecap256'
            threshold_array(2,i)=val_n1p2(rdata(algo_index,cutoff_index,i).ecap256);
    end    
end

i=1;
while (i<16) && (threshold_array(2,i)<0.15) ,i=i+1; end
if (i<=15) && (i>=2)
    point_threshold=i-1;
else
    point_threshold=1;
end
p_ecap=polyfit(threshold_array(1,point_threshold:end),threshold_array(2,point_threshold:end),1);
val_threshold=-1*p_ecap(2)/p_ecap(1);

