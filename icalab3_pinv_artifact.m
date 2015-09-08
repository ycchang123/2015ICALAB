function [ARTIFACTc ARTIFACTa]=icalab3_pinv_artifact(S,Y)
T1=4;T2=7;T3=10;T4=20;T5=40;T6=50;T7=60;T8=70;T9=80;
Y(1,:)=Y(1,:)-Y(1,111);
Y(2,:)=Y(2,:)-Y(2,111);

C(1,:)=[Y(1,T1) Y(2,T1) ];C(2,:)=[Y(1,T2) Y(2,T2) ];
C(3,:)=[Y(1,T3) Y(2,T3) ];C(4,:)=[Y(1,T4) Y(2,T4) ];
C(5,:)=[Y(1,T5) Y(2,T5) ];C(6,:)=[Y(1,T6) Y(2,T6) ];
C(7,:)=[Y(1,T7) Y(2,T7) ];C(8,:)=[Y(1,T8) Y(2,T8) ];
C(9,:)=[Y(1,T9) Y(2,T9) ];
A(1,:)=[Y(1,T1) Y(2,T1) ];A(2,:)=[Y(1,T2) Y(2,T2) ];
A(3,:)=[Y(1,T3) Y(2,T3) ];A(4,:)=[Y(1,T4) Y(2,T4) ];
A(5,:)=[Y(1,T5) Y(2,T5) ];A(6,:)=[Y(1,T6) Y(2,T6) ];
A(7,:)=[Y(1,T7) Y(2,T7) ];A(8,:)=[Y(1,T8) Y(2,T8) ];
A(9,:)=[Y(1,T9) Y(2,T9) ];
b_c=[S(1,T1);S(1,T2);S(1,T3);S(1,T4);S(1,T5);S(1,T6);S(1,T7);S(1,T8);S(1,T9)];
b_a=[S(2,T1);S(2,T2);S(2,T3);S(2,T4);S(2,T5);S(2,T6);S(2,T7);S(2,T8);S(2,T9)];
    
scalar_c=pinv(C)*b_c;
scalar_a=pinv(A)*b_a;

ECAPc=S(1,:)-scalar_c(1)*Y(1,:);
ECAPa=S(2,:)-scalar_a(1)*Y(1,:);

ARTIFACTc=scalar_c(1)*Y(1,:);
ARTIFACTa=scalar_a(1)*Y(1,:);