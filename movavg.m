load moving_avg_data.mat;

moving_avg_factor=3;
for i=1:(111-moving_avg_factor+1)
    tmp_mov_ecap_avg=0;tmp_mov_ECAP1=0;
    for j=i:(i+moving_avg_factor-1)
        tmp_mov_ecap_avg=tmp_mov_ecap_avg+ecap_avg(j);
        tmp_mov_ECAP1=tmp_mov_ECAP1+ECAP1(j);
    end
    mov_ecap_avg(i)=tmp_mov_ecap_avg/moving_avg_factor;
    mov_ECAP1(i)=tmp_mov_ECAP1/moving_avg_factor;
end
plotc3(ecap128,ECAP1,mov_ecap_avg);
