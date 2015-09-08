function ary_data=moving_icalab2(src_dir,algo,title_str) 
ary_data=[];
[a1,b1]=icalab2(src_dir,32,algo,title_str,1);
[a2,b2]=icalab2(src_dir,32,algo,title_str,2);
[a3,b3]=icalab2(src_dir,32,algo,title_str,3);
[a4,b4]=icalab2(src_dir,32,algo,title_str,4);
[a5,b5]=icalab2(src_dir,32,algo,title_str,5);
[a6,b6]=icalab2(src_dir,32,algo,title_str,6);
[a7,b7]=icalab2(src_dir,32,algo,title_str,7);
[a8,b8]=icalab2(src_dir,32,algo,title_str,8);
[a9,b9]=icalab2(src_dir,32,algo,title_str,9);

ary_data=[a1 a2 a3 a4 a5 a6 a7 a8 a9;b1 b2 b3 b4 b5 b6 b7 b8 b9];

[a1,b1]=icalab2(src_dir,64,algo,title_str,1);
[a2,b2]=icalab2(src_dir,64,algo,title_str,2);
[a3,b3]=icalab2(src_dir,64,algo,title_str,3);
[a4,b4]=icalab2(src_dir,64,algo,title_str,4);
[a5,b5]=icalab2(src_dir,64,algo,title_str,5);
[a6,b6]=icalab2(src_dir,64,algo,title_str,6);
[a7,b7]=icalab2(src_dir,64,algo,title_str,7);
[a8,b8]=icalab2(src_dir,64,algo,title_str,8);
[a9,b9]=icalab2(src_dir,64,algo,title_str,9);

ary_data=[ary_data;a1 a2 a3 a4 a5 a6 a7 a8 a9;b1 b2 b3 b4 b5 b6 b7 b8 b9];

%Algorithm ***
%ary_data=moving_icalab2('src42\','jadetd','Algorithm jadetd');