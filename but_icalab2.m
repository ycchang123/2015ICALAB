function ary_data=but_icalab2(src_dir,algo,title_str) 
ary_data=[];
[a1,b1]=icalab2_but(src_dir,32,algo,title_str,10,10000);
[a2,b2]=icalab2_but(src_dir,32,algo,title_str,10,11000);
[a3,b3]=icalab2_but(src_dir,32,algo,title_str,10,12000);
[a4,b4]=icalab2_but(src_dir,32,algo,title_str,10,13000);
[a5,b5]=icalab2_but(src_dir,32,algo,title_str,10,14000);
[a6,b6]=icalab2_but(src_dir,32,algo,title_str,10,15000);
[a7,b7]=icalab2_but(src_dir,32,algo,title_str,10,16000);
[a8,b8]=icalab2_but(src_dir,32,algo,title_str,10,17000);
[a9,b9]=icalab2_but(src_dir,32,algo,title_str,10,18000);
[a10,b10]=icalab2_but(src_dir,32,algo,title_str,10,19000);
[a11,b11]=icalab2_but(src_dir,32,algo,title_str,10,20000);
[a12,b12]=icalab2_but(src_dir,64,algo,title_str,10,21000);
[a13,b13]=icalab2_but(src_dir,64,algo,title_str,10,22000);
[a14,b14]=icalab2_but(src_dir,64,algo,title_str,10,23000);
[a15,b15]=icalab2_but(src_dir,64,algo,title_str,10,24000);
[a16,b16]=icalab2_but(src_dir,64,algo,title_str,10,25000);
[a17,b17]=icalab2_but(src_dir,64,algo,title_str,10,26000);
[a18,b18]=icalab2_but(src_dir,64,algo,title_str,10,27000);
%[a19,b19]=icalab2_but(src_dir,64,algo,title_str,10,28000);

ary_data=[a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 a14 a15 a16 a17 a18 ;b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14 b15 b16 b17 b18 ];

[a1,b1]=icalab2_but(src_dir,64,algo,title_str,10,10000);
[a2,b2]=icalab2_but(src_dir,64,algo,title_str,10,11000);
[a3,b3]=icalab2_but(src_dir,64,algo,title_str,10,12000);
[a4,b4]=icalab2_but(src_dir,64,algo,title_str,10,13000);
[a5,b5]=icalab2_but(src_dir,64,algo,title_str,10,14000);
[a6,b6]=icalab2_but(src_dir,64,algo,title_str,10,15000);
[a7,b7]=icalab2_but(src_dir,64,algo,title_str,10,16000);
[a8,b8]=icalab2_but(src_dir,64,algo,title_str,10,17000);
[a9,b9]=icalab2_but(src_dir,64,algo,title_str,10,18000);
[a10,b10]=icalab2_but(src_dir,64,algo,title_str,10,19000);
[a11,b11]=icalab2_but(src_dir,64,algo,title_str,10,20000);
[a12,b12]=icalab2_but(src_dir,64,algo,title_str,10,21000);
[a13,b13]=icalab2_but(src_dir,64,algo,title_str,10,22000);
[a14,b14]=icalab2_but(src_dir,64,algo,title_str,10,23000);
[a15,b15]=icalab2_but(src_dir,64,algo,title_str,10,24000);
[a16,b16]=icalab2_but(src_dir,64,algo,title_str,10,25000);
[a17,b17]=icalab2_but(src_dir,64,algo,title_str,10,26000);
[a18,b18]=icalab2_but(src_dir,64,algo,title_str,10,27000);
%[a19,b19]=icalab2_but(src_dir,64,algo,title_str,10,28000);
ary_data=[ary_data;a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 a14 a15 a16 a17 a18 ;b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14 b15 b16 b17 b18 ];
