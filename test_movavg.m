load data2.mat;

ecapICA32=data2(11,4).data(15).ecapICA32;
ecap128=data2(11,4).data(15).ecap128;
ecap32=data2(11,4).data(15).ecap32;
filter_ecapICA32=data2(11,4).data(15).filter_ecapICA32;

figure;hold all
plot(ecap128);plot(ecap32);plot(ecapICA32);
for i=1:7
    mov_ecapICA32=movavg(ecapICA32,i);
    if i==2
        plot(mov_ecapICA32);
    end
    
    [MaxVal,MaxIdx]=max(mov_ecapICA32(MaxStart:MaxEnd));
    [MinVal,MinIdx]=min(mov_ecapICA32(MinStart:MinEnd));
    val_mov_ecapICA32=abs(MaxVal-MinVal);
    disp(i);
    disp(val_mov_ecapICA32);
end

legend('ecap128','ecap32','ecapICA32','moving avg ecapICA32');

%mov_ecapICA32=movavg(ecapICA32,2);
%plotc3(ecap32,ecap128,mov_ecapICA32);


MaxStart=31;MaxEnd=60;MinStart=11;MinEnd=30;

[MaxVal,MaxIdx]=max(ecap128(MaxStart:MaxEnd));
[MinVal,MinIdx]=min(ecap128(MinStart:MinEnd));
val_ecap128=abs(MaxVal-MinVal);
disp('ecap128');disp(val_ecap128);

[MaxVal,MaxIdx]=max(ecap32(MaxStart:MaxEnd));
[MinVal,MinIdx]=min(ecap32(MinStart:MinEnd));
val_ecap32=abs(MaxVal-MinVal);
disp('ecap32');disp(val_ecap32);

[MaxVal,MaxIdx]=max(ecapICA32(MaxStart:MaxEnd));
[MinVal,MinIdx]=min(ecapICA32(MinStart:MinEnd));
val_ecapICA32=abs(MaxVal-MinVal);
disp('ecapICA32');disp(val_ecapICA32);

[MaxVal,MaxIdx]=max(filter_ecapICA32(MaxStart:MaxEnd));
[MinVal,MinIdx]=min(filter_ecapICA32(MinStart:MinEnd));
val_filter_ecapICA32=abs(MaxVal-MinVal);
disp('filter_ecapICA32');disp(val_filter_ecapICA32);
