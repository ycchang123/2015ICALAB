load data2.mat;

ecapICA32=data2(11,4).data(15).ecapICA32;
ecap128=data2(11,4).data(15).ecap128;
ecap32=data2(11,4).data(15).ecap32;
filter_ecapICA32=data2(11,4).data(15).filter_ecapICA32;
figure;hold all;
plot(ecap128);plot(ecap32);plot(ecapICA32);
for i=1:7
    mov_ecapICA32=movavg(ecapICA32,i);
    if i==2
        plot(mov_ecapICA32);
    end
    val_mov_ecapICA32=val_n1p2(mov_ecapICA32);
    disp(i);
    disp(val_mov_ecapICA32);
end

legend('ecap128','ecap32','ecapICA32','moving avg ecapICA32');

val_ecap128=val_n1p2(ecap128);
disp('ecap128');disp(val_ecap128);

val_ecap32=val_n1p2(ecap32);
disp('ecap32');disp(val_ecap32);

val_ecapICA32=val_n1p2(ecapICA32);
disp('ecapICA32');disp(val_ecapICA32);

val_filter_ecapICA32=val_n1p2(filter_ecapICA32);
disp('filter_ecapICA32');disp(val_filter_ecapICA32);
