
for i=7:15
    figure(i);hold all;
    axis([0,111,-1.5,1.5]);
    str=['CU= ' num2str(i) ' AP ECAP 128 samples vs ECAP ICA 32 samples(LPF cut of freq=14K)'];
    title(str);
    plot(data2(1,5).data(i).ecap128,'-');
    plot(data2(1,5).data(i).filter_ecapICA32,':');
    legend('AP ECAP 128 samples','ECAP ICA 32 samples');
end

figure;hold all;
%axis([0,111,-1.5,1.5]);
for i=7:15
    plot(data2(1,5).data(i).filter_ecapICA32);
end
title('CU=7~15 ECAP ICA 64 samples (LPF cut of freq=14K)');