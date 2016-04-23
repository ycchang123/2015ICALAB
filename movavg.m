%load moving_avg_data.mat;
function mov_signal=movavg(input_signal,factor)

if factor >= 2
    for i=112:(111+factor-1)
        input_signal(i)=input_signal(111);
    end
end
for i=1:111
    tmp_avg=0;
    for j=i:(i+factor-1)
        tmp_avg=tmp_avg+input_signal(j);
    end
    mov_signal(i)=tmp_avg/factor;
end
