tic;
parfor i=1:32
    data3_src42(i).data2=cf_icalab3('src42v2\');
    data3_src45(i).data2=cf_icalab3('src45v2\');
    data3_src1210(i).data2=cf_icalab3('src1210v2\');
    data3_src1213(i).data2=cf_icalab3('src1213v2\');
    data3_src86(i).data2=cf_icalab3('src86v2\');
    data3_src89(i).data2=cf_icalab3('src89v2\');
    for j=1:16
        for k=1:18
            data3_src42(i).data2(j,k).data='';
            data3_src45(i).data2(j,k).data='';
            data3_src1210(i).data2(j,k).data='';
            data3_src1213(i).data2(j,k).data='';
            data3_src86(i).data2(j,k).data='';
            data3_src89(i).data2(j,k).data='';
        end
    end
end
toc;