function [scalar_S1 scalar_S2  scalar_S3 scalar_S4]=icalab4_pinv_4i(S,Y)
%load icalab4_4i_pinv_test_data.mat;
%S=S32_4i;Y=Y32_4i;
T1=4;T2=7;T3=10;T4=20;T5=40;T6=50;T7=60;T8=70;T9=80;
Y(1,:)=Y(1,:)-Y(1,111);
Y(2,:)=Y(2,:)-Y(2,111);
Y(3,:)=Y(3,:)-Y(3,111);
Y(4,:)=Y(4,:)-Y(4,111);

S1(1,:)=[Y(1,T1) Y(2,T1) Y(3,T1) Y(4,T1)];
S1(2,:)=[Y(1,T2) Y(2,T2) Y(3,T2) Y(4,T2)];
S1(3,:)=[Y(1,T3) Y(2,T3) Y(3,T3) Y(4,T3)];
S1(4,:)=[Y(1,T4) Y(2,T4) Y(3,T4) Y(4,T4)];
S1(5,:)=[Y(1,T5) Y(2,T5) Y(3,T5) Y(4,T5)];
S1(6,:)=[Y(1,T6) Y(2,T6) Y(3,T6) Y(4,T6)];
S1(7,:)=[Y(1,T7) Y(2,T7) Y(3,T7) Y(4,T7)];
S1(8,:)=[Y(1,T8) Y(2,T8) Y(3,T8) Y(4,T8)];
S1(9,:)=[Y(1,T9) Y(2,T9) Y(3,T9) Y(4,T9)];

b_S1=[S(1,T1);S(1,T2);S(1,T3);S(1,T4);S(1,T5);S(1,T6);S(1,T7);S(1,T8);S(1,T9)];
b_S2=[S(2,T1);S(2,T2);S(2,T3);S(2,T4);S(2,T5);S(2,T6);S(2,T7);S(2,T8);S(2,T9)];
b_S3=[S(3,T1);S(3,T2);S(3,T3);S(3,T4);S(3,T5);S(3,T6);S(3,T7);S(3,T8);S(3,T9)];
b_S4=[S(4,T1);S(4,T2);S(4,T3);S(4,T4);S(4,T5);S(4,T6);S(4,T7);S(4,T8);S(4,T9)];

scalar_S1=pinv(S1)*b_S1;
scalar_S2=pinv(S1)*b_S2;
scalar_S3=pinv(S1)*b_S3;
scalar_S4=pinv(S1)*b_S4;

ECAP_S1=S(1,:)-scalar_S1(1)*Y(1,:);
ECAP_S2=S(2,:)-scalar_S2(1)*Y(2,:);
ECAP_S3=S(3,:)-scalar_S3(1)*Y(3,:);
