%load moving_avg_data.mat;
function mov_signal=movavg(input_signal,factor);

for i=1:(111-factor+1)
    tmp_avg=0;
    for j=i:(i+factor-1)
        tmp_avg=tmp_avg+input_signal(j);
    end
    mov_signal(i)=tmp_avg/factor;
end
