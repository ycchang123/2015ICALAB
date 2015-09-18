load data2.mat;
data=icalab3('src42v2\','erica',10,13000);
figure;hold all;
plot(data(15).ecapICA32);
plot(data(15).filter_ecapICA32);

