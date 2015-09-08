x=[10000,11000,12000,13000,14000,15000,16000,17000,18000,19000,20000,21000,22000,23000,24000,25000 26000 27000]; %幾組頻率訊號，這是3組的結果，當然也可以4 ,5 6....很多組
fid =fopen('aaa.txt','w');
fprintf(fid,'128 samples AltPola ECAP threshold    130.5876\n');

ary_data=but_icalab2('src45\','ngfica','Algorithm ngfica');
fprintf(fid,'NG-FICA\n');
fprintf(fid,'Cutoff\t'); fprintf(fid,'%d\t',x);fprintf(fid,'\n');
%fprintf(fid,'32s AP ECAP threshold\t');fprintf(fid,'%3.2f\t',ary_data(1,:));fprintf(fid,'\n');
fprintf(fid,'32s ICA\t');fprintf(fid,'%3.2f\t',ary_data(2,:));fprintf(fid,'\n');
%fprintf(fid,'64s AP ECAP threshold\t');fprintf(fid,'%3.2f\t',ary_data(3,:));fprintf(fid,'\n');
fprintf(fid,'64s ICA\t');fprintf(fid,'%3.2f\t',ary_data(4,:));fprintf(fid,'\n');

ary_data=but_icalab2('src45\','amuse','Algorithm amuse');
fprintf(fid,'amuse\n');
fprintf(fid,'Cutoff\t'); fprintf(fid,'%d\t',x);fprintf(fid,'\n');
fprintf(fid,'32s ICA\t');fprintf(fid,'%3.2f\t',ary_data(2,:));fprintf(fid,'\n');
fprintf(fid,'64s ICA\t');fprintf(fid,'%3.2f\t',ary_data(4,:));fprintf(fid,'\n');

ary_data=but_icalab2('src45\','jadeop','Algorithm jadeop');
fprintf(fid,'jadeop\n');
fprintf(fid,'Cutoff\t'); fprintf(fid,'%d\t',x);fprintf(fid,'\n');
fprintf(fid,'32s ICA\t');fprintf(fid,'%3.2f\t',ary_data(2,:));fprintf(fid,'\n');
fprintf(fid,'64s ICA\t');fprintf(fid,'%3.2f\t',ary_data(4,:));fprintf(fid,'\n');

ary_data=but_icalab2('src45\','fjade','Algorithm fjade');
fprintf(fid,'fjade\n');
fprintf(fid,'Cutoff\t'); fprintf(fid,'%d\t',x);fprintf(fid,'\n');
fprintf(fid,'32s ICA\t');fprintf(fid,'%3.2f\t',ary_data(2,:));fprintf(fid,'\n');
fprintf(fid,'64s ICA\t');fprintf(fid,'%3.2f\t',ary_data(4,:));fprintf(fid,'\n');

%ary_data=but_icalab2('src45\','sobi','Algorithm sobi');
%fprintf(fid,'sobi\n');
%fprintf(fid,'Cutoff\t'); fprintf(fid,'%d\t',x);fprintf(fid,'\n');
%fprintf(fid,'32s ICA\t');fprintf(fid,'%3.2f\t',ary_data(2,:));fprintf(fid,'\n');
%fprintf(fid,'64s ICA\t');fprintf(fid,'%3.2f\t',ary_data(4,:));fprintf(fid,'\n');

ary_data=but_icalab2('src45\','erica','Algorithm erica');
fprintf(fid,'erica\n');
fprintf(fid,'Cutoff\t'); fprintf(fid,'%d\t',x);fprintf(fid,'\n');
fprintf(fid,'32s ICA\t');fprintf(fid,'%3.2f\t',ary_data(2,:));fprintf(fid,'\n');
fprintf(fid,'64s ICA\t');fprintf(fid,'%3.2f\t',ary_data(4,:));fprintf(fid,'\n');

%ary_data=but_icalab2('src45\','powerica','Algorithm powerica');
%fprintf(fid,'powerica\n');
%fprintf(fid,'Cutoff\t'); fprintf(fid,'%d\t',x);fprintf(fid,'\n');
%fprintf(fid,'32s ICA\t');fprintf(fid,'%3.2f\t',ary_data(2,:));fprintf(fid,'\n');
%fprintf(fid,'64s ICA\t');fprintf(fid,'%3.2f\t',ary_data(4,:));fprintf(fid,'\n');

ary_data=but_icalab2('src45\','symwhite','Algorithm symwhite');
fprintf(fid,'symwhite\n');
fprintf(fid,'Cutoff\t'); fprintf(fid,'%d\t',x);fprintf(fid,'\n');
fprintf(fid,'32s ICA\t');fprintf(fid,'%3.2f\t',ary_data(2,:));fprintf(fid,'\n');
fprintf(fid,'64s ICA\t');fprintf(fid,'%3.2f\t',ary_data(4,:));fprintf(fid,'\n');

%ary_data=but_icalab2('src45\','multicombi','Algorithm multicombi');
%fprintf(fid,'multicombi\n');
%fprintf(fid,'Cutoff\t'); fprintf(fid,'%d\t',x);fprintf(fid,'\n');
%fprintf(fid,'32s ICA\t');fprintf(fid,'%3.2f\t',ary_data(2,:));fprintf(fid,'\n');
%fprintf(fid,'64s ICA\t');fprintf(fid,'%3.2f\t',ary_data(4,:));fprintf(fid,'\n');

ary_data=but_icalab2('src45\','fajdc4','Algorithm fajdc4');
fprintf(fid,'fajdc4\n');
fprintf(fid,'Cutoff\t'); fprintf(fid,'%d\t',x);fprintf(fid,'\n');
fprintf(fid,'32s ICA\t');fprintf(fid,'%3.2f\t',ary_data(2,:));fprintf(fid,'\n');
fprintf(fid,'64s ICA\t');fprintf(fid,'%3.2f\t',ary_data(4,:));fprintf(fid,'\n');

ary_data=but_icalab2('src45\','qjade','Algorithm qjade');
fprintf(fid,'qjade\n');
fprintf(fid,'Cutoff\t'); fprintf(fid,'%d\t',x);fprintf(fid,'\n');
fprintf(fid,'32s ICA\t');fprintf(fid,'%3.2f\t',ary_data(2,:));fprintf(fid,'\n');
fprintf(fid,'64s ICA\t');fprintf(fid,'%3.2f\t',ary_data(4,:));fprintf(fid,'\n');

ary_data=but_icalab2('src45\','jadetd','Algorithm jadetd');
fprintf(fid,'jadetd\n');
fprintf(fid,'Cutoff\t'); fprintf(fid,'%d\t',x);fprintf(fid,'\n');
fprintf(fid,'32s ICA\t');fprintf(fid,'%3.2f\t',ary_data(2,:));fprintf(fid,'\n');
fprintf(fid,'64s ICA\t');fprintf(fid,'%3.2f\t',ary_data(4,:));fprintf(fid,'\n');

ary_data=but_icalab2('src45\','ewasobi','Algorithm ewasobi');
fprintf(fid,'ewasobi\n');
fprintf(fid,'Cutoff\t'); fprintf(fid,'%d\t',x);fprintf(fid,'\n');
fprintf(fid,'32s ICA\t');fprintf(fid,'%3.2f\t',ary_data(2,:));fprintf(fid,'\n');
fprintf(fid,'64s ICA\t');fprintf(fid,'%3.2f\t',ary_data(4,:));fprintf(fid,'\n');

%ary_data=but_icalab2('src45\','wasobi','Algorithm wasobi');
%fprintf(fid,'wasobi\n');
%fprintf(fid,'Cutoff\t'); fprintf(fid,'%d\t',x);fprintf(fid,'\n');
%fprintf(fid,'32s ICA\t');fprintf(fid,'%3.2f\t',ary_data(2,:));fprintf(fid,'\n');
%fprintf(fid,'64s ICA\t');fprintf(fid,'%3.2f\t',ary_data(4,:));fprintf(fid,'\n');

ary_data=but_icalab2('src45\','thinica','Algorithm thinica');
fprintf(fid,'thinica\n');
fprintf(fid,'Cutoff\t'); fprintf(fid,'%d\t',x);fprintf(fid,'\n');
fprintf(fid,'32s ICA\t');fprintf(fid,'%3.2f\t',ary_data(2,:));fprintf(fid,'\n');
fprintf(fid,'64s ICA\t');fprintf(fid,'%3.2f\t',ary_data(4,:));fprintf(fid,'\n');

ary_data=but_icalab2('src45\','evd2','Algorithm evd2');
fprintf(fid,'evd2\n');
fprintf(fid,'Cutoff\t'); fprintf(fid,'%d\t',x);fprintf(fid,'\n');
fprintf(fid,'32s ICA\t');fprintf(fid,'%3.2f\t',ary_data(2,:));fprintf(fid,'\n');
fprintf(fid,'64s ICA\t');fprintf(fid,'%3.2f\t',ary_data(4,:));fprintf(fid,'\n');

fclose(fid);
type aaa.txt;