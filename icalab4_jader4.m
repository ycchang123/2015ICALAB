fs=56000;

data42v2=LoadModule2('src42v2\');  %index max=15

data24k=LoadModule3('src24v3_1k\');
data42k=LoadModule3('src42v3_1k\');
data45k=LoadModule3('src45v3_1k\');
data54k=LoadModule3('src54v3_1k\');

S42v2=data42v2(15).ST0Avg32-data42v2(15).ST2Avg32;
S42v2=[S42v2; data42v2(15).ST1Avg32-data42v2(15).ST2Avg32];
S42v2=[S42v2; data42v2(15).ST0Avg32-data42v2(15).ST2Avg32];
S42v2=[S42v2; data42v2(15).ST1Avg32-data42v2(15).ST2Avg32];

S2442_1k=data24k(10).ST0Avg32-data24k(10).ST2Avg32;
S2442_1k=[S2442_1k ; data24k(10).ST1Avg32-data24k(10).ST2Avg32];
S2442_1k=[S2442_1k ; data42k(10).ST0Avg32-data42k(10).ST2Avg32];
S2442_1k=[S2442_1k ; data42k(10).ST1Avg32-data42k(10).ST2Avg32];

S42v2_tmp=S42v2;
for i=1:11 S42v2=[S42v2 S42v2_tmp];end
for i=0:1
    for j=0:1
        for k=0:1
            for l=0:1
                S42v2_n(1,:)=(-1)^i*S42v2(1,:);
                S42v2_n(2,:)=(-1)^j*S42v2(2,:);
                S42v2_n(3,:)=(-1)^k*S42v2(3,:);
                S42v2_n(4,:)=(-1)^l*S42v2(4,:);
                Y42v2=ica_f(S42v2_n',1332,fs);
                disp(length(Y42v2(:,1)));
                figure (1);hold all
                plot (Y42v2(1,1:111));
                figure (2);hold all;
                plot (Y42v2(2,1:111));
            end
        end
    end
end

S2442_1k_tmp=S2442_1k;
for i=1:11 S2442_1k=[S2442_1k S2442_1k_tmp];end
for i=0:1
    for j=0:1
        for k=0:1
            for l=0:1
                S2442_1k_n(1,:)=(-1)^i*S2442_1k(1,:);
                S2442_1k_n(2,:)=(-1)^j*S2442_1k(2,:);
                S2442_1k_n(3,:)=(-1)^k*S2442_1k(3,:);
                S2442_1k_n(4,:)=(-1)^l*S2442_1k(4,:);
                Y2442_1k=ica_f(S2442_1k_n',1332,fs);
                disp(length(Y2442_1k(:,1)));
                figure (3);hold all
                plot (Y2442_1k(1,1:111));
                figure (4);hold all;
                plot (Y2442_1k(2,1:111));
            end
        end
    end
end