fs=56000;

algo='jadetd';
%AlgoList={'ngfica' 'amuse' 'jadeop' 'fjade' 'sobi' 'erica' 'powerica' 'symwhite' 'multicombi' 'fajdc4' 'qjade' 'jadetd' 'ewasobi' 'wasobi' 'thinica' 'evd2'};
AlgoList={'ngfica' 'amuse' 'jadeop' 'fjade' 'sobi' 'erica' 'powerica' 'symwhite' 'multicombi' 'fajdc4' 'qjade'  'ewasobi' 'wasobi'  'evd2'};
%AlgoList={'ngfica' 'amuse' 'jadeop' 'fjade' 'sobi' 'erica' 'powerica' 'symwhite' 'fajdc4' 'qjade' 'jadetd' 'ewasobi' 'wasobi' 'thinica' 'evd2'};
%AlgoList={'erica'};

MaxStart=31;MaxEnd=60;MinStart=11;MinEnd=30;

data42v2=LoadModule2('src42v2\');  %index max=15

data24k=LoadModule3('src24v3_1k\');
data42k=LoadModule3('src42v3_1k\');
data45k=LoadModule3('src45v3_1k\');
data54k=LoadModule3('src54v3_1k\');

S42v2=data42v2(15).ST0Avg32-data42v2(15).ST2Avg32;
S42v2=[S42v2; data42v2(15).ST1Avg32-data42v2(15).ST2Avg32];
S42v2=[S42v2; data42v2(15).ST0Avg32-data42v2(15).ST2Avg32];
S42v2=[S42v2; data42v2(15).ST1Avg32-data42v2(15).ST2Avg32];

%case1 input
S4242v3_1k=data42k(10).ST0Avg32-data42k(10).ST2Avg32;
S4242v3_1k=[S4242v3_1k; data42k(10).ST1Avg32-data42k(10).ST2Avg32];
S4242v3_1k=[S4242v3_1k; data42k(10).ST0Avg32-data42k(10).ST2Avg32];
S4242v3_1k=[S4242v3_1k; data42k(10).ST1Avg32-data42k(10).ST2Avg32];

%case2 input
S4242v3_1k_2=data42k(10).ST0Avg32-data42k(10).ST2Avg32;
S4242v3_1k_2=[S4242v3_1k_2; -1*(data42k(10).ST0Avg32-data42k(10).ST2Avg32)];
S4242v3_1k_2=[S4242v3_1k_2; data42k(10).ST1Avg32-data42k(10).ST2Avg32];
S4242v3_1k_2=[S4242v3_1k_2; -1*(data42k(10).ST1Avg32-data42k(10).ST2Avg32)];

%case3 input
S2442v3_1k=data24k(10).ST0Avg32-data24k(10).ST2Avg32;
S2442v3_1k=[S2442v3_1k ; data24k(10).ST1Avg32-data24k(10).ST2Avg32];
S2442v3_1k=[S2442v3_1k ; data42k(10).ST0Avg32-data42k(10).ST2Avg32];
S2442v3_1k=[S2442v3_1k ; data42k(10).ST1Avg32-data42k(10).ST2Avg32];
%case4_1 input
S2442v3_1k_3i_1=[];
%S2442v3_1k_3i_1=[S2442v3_1k_3i_1 ; data24k(10).ST0Avg32-data24k(10).ST2Avg32];
S2442v3_1k_3i_1=[S2442v3_1k_3i_1 ; data24k(10).ST1Avg32-data24k(10).ST2Avg32];
S2442v3_1k_3i_1=[S2442v3_1k_3i_1 ; data42k(10).ST0Avg32-data42k(10).ST2Avg32];
S2442v3_1k_3i_1=[S2442v3_1k_3i_1 ; data42k(10).ST1Avg32-data42k(10).ST2Avg32];
%case4_2 input
S2442v3_1k_3i_2=[];
S2442v3_1k_3i_2=[S2442v3_1k_3i_2 ; data24k(10).ST0Avg32-data24k(10).ST2Avg32];
%S2442v3_1k_3i_2=[S2442v3_1k_3i_2 ; data24k(10).ST1Avg32-data24k(10).ST2Avg32];
S2442v3_1k_3i_2=[S2442v3_1k_3i_2 ; data42k(10).ST0Avg32-data42k(10).ST2Avg32];
S2442v3_1k_3i_2=[S2442v3_1k_3i_2 ; data42k(10).ST1Avg32-data42k(10).ST2Avg32];
%case4_3 input
S2442v3_1k_3i_3=[];
S2442v3_1k_3i_3=[S2442v3_1k_3i_3 ; data24k(10).ST0Avg32-data24k(10).ST2Avg32];
S2442v3_1k_3i_3=[S2442v3_1k_3i_3 ; data24k(10).ST1Avg32-data24k(10).ST2Avg32];
%S2442v3_1k_3i_3=[S2442v3_1k_3i_3 ; data42k(10).ST0Avg32-data42k(10).ST2Avg32];
S2442v3_1k_3i_3=[S2442v3_1k_3i_3 ; data42k(10).ST1Avg32-data42k(10).ST2Avg32];
%case4_4 input
S2442v3_1k_3i_4=[];
S2442v3_1k_3i_4=[S2442v3_1k_3i_4 ; data24k(10).ST0Avg32-data24k(10).ST2Avg32];
S2442v3_1k_3i_4=[S2442v3_1k_3i_4 ; data24k(10).ST1Avg32-data24k(10).ST2Avg32];
S2442v3_1k_3i_4=[S2442v3_1k_3i_4 ; data42k(10).ST0Avg32-data42k(10).ST2Avg32];
%S2442v3_1k_3i_4=[S2442v3_1k_3i_4 ; data42k(10).ST1Avg32-data42k(10).ST2Avg32];

%maybe discussion??
ecap32_24k=data24k(10).ecap32;
ecap32_42k=data42k(10).ecap32;
cuLevel_24k=data24k(10).cuLevel;
cuLevel_42k=data42k(10).cuLevel;

S32_4i=S2442v3_1k;

SCath=[S4242v3_1k(1,:);S4242v3_1k(2,:)];
%plotc2(SCath(1,:),SCath(2,:));
%title('el24 inpub signal');legend('Cathodic','Anodic');
YCath=icalab3_algo(SCath,char(AlgoList(1)));
%plotc2(YCath(2,:),ecap32_24k);
%title('el24 erica algo without pseudo-inverse');legend('errica algo output2','AP ECAP el24');
[ECAPc ECAPa]=icalab3_pinv(SCath,YCath);
ecapICA32=0.5*(ECAPc-ECAPa);
%plotc2(ecapICA32,ecap32_24k);
%title('el24 erica algo with pseudo inverse');legend('errica algo output2','AP ECAP el24');

for i=1:length(AlgoList)
    Y32_4i=icalab3_algo_noswap(S32_4i,char(AlgoList(i)));
    [scalar_S1 scalar_S2 scalar_S3 scalar_S4]=icalab4_pinv_4i(S32_4i,Y32_4i);
    num_out_array=length(Y32_4i(:,1));
    fprintf('%s',char(AlgoList(i)));disp(num_out_array);
    figure;hold all;title(char(AlgoList(i)));
    %plot(ecap32_24k);
    x=1:111;
    for j=1:num_out_array
        plot(x,Y32_4i(j,:));
    end
    %legend('ecap24','output1','output2','output3','output4');
    legend('output1','output2','output3','output4');
 
    %figure; hold all;
    %plot(ecap32_24k);plot(ecap32_42k);
    %plot(Y32_4i(2,:));plot(Y32_4i(3,:));
    %title ('no pseudo inverse');
    %legend('ecap24','ecap42','ecap1','ecap2');
    
    %figure; hold all;
    %plot(ecap32_24k);plot(ecap32_42k);
    %plot(-1*scalar_S1(2)*Y32_4i(2,:));plot(-1*scalar_S1(3)*Y32_4i(3,:));
    %title ('pseudo inverse');
    %legend('ecap24','ecap42','ecap1','ecap2');    
    
end
   