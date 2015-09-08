i=1;signal_diff=0;
while ((signal_diff ==0) && (i <=16))
    j=1;
    while ((signal_diff ==0) && (j<=18))
        if (abs(data20(i,j).ecapICA32Threshold-data21(i,j).ecapICA32Threshold) >= 0.01)        
        %if (data20(i,j).ecapICA32Threshold ~= data21(i,j).ecapICA32Threshold) 
            signal_diff=1;
        end        
        j=j+1;
    end
    i=i+1;
end
if (signal_diff==0) 
    fprintf('\n both data2 the same\n');
else
    fprintf('\n both data2 different\n');
end