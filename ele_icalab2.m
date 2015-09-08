x=1:1:9;
fid =fopen('aaa.txt','w');
fprintf(fid,'128 samples AltPola ECAP threshold    120.0552\n');

ary_data=moving_icalab2('src42\','ngfica','Algorithm ngfica');
fprintf(fid,'NG-FICA\n');
fprintf(fid,'N Moving AVerage\t\t'); fprintf(fid,'%d\t\t',x);fprintf(fid,'\n');
fprintf(fid,'32s AP ECAP threshold\t');fprintf(fid,'%3.2f\t',ary_data(1,:));fprintf(fid,'\n');
fprintf(fid,'32s ICA ECAP threshold\t');fprintf(fid,'%3.2f\t',ary_data(2,:));fprintf(fid,'\n');
fprintf(fid,'64s AP ECAP threshold\t');fprintf(fid,'%3.2f\t',ary_data(3,:));fprintf(fid,'\n');
fprintf(fid,'64s ICA ECAP threshold\t');fprintf(fid,'%3.2f\t',ary_data(4,:));fprintf(fid,'\n');

ary_data=moving_icalab2('src42\','amuse','Algorithm amuse');
fprintf(fid,'amuse\n');
fprintf(fid,'N Moving AVerage\t\t'); fprintf(fid,'%d\t\t',x);fprintf(fid,'\n');
fprintf(fid,'32s ICA ECAP threshold\t');fprintf(fid,'%3.2f\t',ary_data(2,:));fprintf(fid,'\n');
fprintf(fid,'64s ICA ECAP threshold\t');fprintf(fid,'%3.2f\t',ary_data(4,:));fprintf(fid,'\n');

ary_data=moving_icalab2('src42\','jadeop','Algorithm jadeop');
fprintf(fid,'jadeop\n');
fprintf(fid,'N Moving AVerage\t\t'); fprintf(fid,'%d\t\t',x);fprintf(fid,'\n');
fprintf(fid,'32s ICA ECAP threshold\t');fprintf(fid,'%3.2f\t',ary_data(2,:));fprintf(fid,'\n');
fprintf(fid,'64s ICA ECAP threshold\t');fprintf(fid,'%3.2f\t',ary_data(4,:));fprintf(fid,'\n');

ary_data=moving_icalab2('src42\','fjade','Algorithm fjade');
fprintf(fid,'fjade\n');
fprintf(fid,'N Moving AVerage\t\t'); fprintf(fid,'%d\t\t',x);fprintf(fid,'\n');
fprintf(fid,'32s ICA ECAP threshold\t');fprintf(fid,'%3.2f\t',ary_data(2,:));fprintf(fid,'\n');
fprintf(fid,'64s ICA ECAP threshold\t');fprintf(fid,'%3.2f\t',ary_data(4,:));fprintf(fid,'\n');

ary_data=moving_icalab2('src42\','sobi','Algorithm sobi');
fprintf(fid,'sobi\n');
fprintf(fid,'N Moving AVerage\t\t'); fprintf(fid,'%d\t\t',x);fprintf(fid,'\n');
fprintf(fid,'32s ICA ECAP threshold\t');fprintf(fid,'%3.2f\t',ary_data(2,:));fprintf(fid,'\n');
fprintf(fid,'64s ICA ECAP threshold\t');fprintf(fid,'%3.2f\t',ary_data(4,:));fprintf(fid,'\n');

ary_data=moving_icalab2('src42\','erica','Algorithm erica');
fprintf(fid,'erica\n');
fprintf(fid,'N Moving AVerage\t\t'); fprintf(fid,'%d\t\t',x);fprintf(fid,'\n');
fprintf(fid,'32s ICA ECAP threshold\t');fprintf(fid,'%3.2f\t',ary_data(2,:));fprintf(fid,'\n');
fprintf(fid,'64s ICA ECAP threshold\t');fprintf(fid,'%3.2f\t',ary_data(4,:));fprintf(fid,'\n');

ary_data=moving_icalab2('src42\','powerica','Algorithm powerica');
fprintf(fid,'powerica\n');
fprintf(fid,'N Moving AVerage\t\t'); fprintf(fid,'%d\t\t',x);fprintf(fid,'\n');
fprintf(fid,'32s ICA ECAP threshold\t');fprintf(fid,'%3.2f\t',ary_data(2,:));fprintf(fid,'\n');
fprintf(fid,'64s ICA ECAP threshold\t');fprintf(fid,'%3.2f\t',ary_data(4,:));fprintf(fid,'\n');

ary_data=moving_icalab2('src42\','symwhite','Algorithm symwhite');
fprintf(fid,'symwhite\n');
fprintf(fid,'N Moving AVerage\t\t'); fprintf(fid,'%d\t\t',x);fprintf(fid,'\n');
fprintf(fid,'32s ICA ECAP threshold\t');fprintf(fid,'%3.2f\t',ary_data(2,:));fprintf(fid,'\n');
fprintf(fid,'64s ICA ECAP threshold\t');fprintf(fid,'%3.2f\t',ary_data(4,:));fprintf(fid,'\n');

ary_data=moving_icalab2('src42\','multicombi','Algorithm multicombi');
fprintf(fid,'multicombi\n');
fprintf(fid,'N Moving AVerage\t\t'); fprintf(fid,'%d\t\t',x);fprintf(fid,'\n');
fprintf(fid,'32s ICA ECAP threshold\t');fprintf(fid,'%3.2f\t',ary_data(2,:));fprintf(fid,'\n');
fprintf(fid,'64s ICA ECAP threshold\t');fprintf(fid,'%3.2f\t',ary_data(4,:));fprintf(fid,'\n');

ary_data=moving_icalab2('src42\','fajdc4','Algorithm fajdc4');
fprintf(fid,'fajdc4\n');
fprintf(fid,'N Moving AVerage\t\t'); fprintf(fid,'%d\t\t',x);fprintf(fid,'\n');
fprintf(fid,'32s ICA ECAP threshold\t');fprintf(fid,'%3.2f\t',ary_data(2,:));fprintf(fid,'\n');
fprintf(fid,'64s ICA ECAP threshold\t');fprintf(fid,'%3.2f\t',ary_data(4,:));fprintf(fid,'\n');

ary_data=moving_icalab2('src42\','qjade','Algorithm qjade');
fprintf(fid,'qjade\n');
fprintf(fid,'N Moving AVerage\t\t'); fprintf(fid,'%d\t\t',x);fprintf(fid,'\n');
fprintf(fid,'32s ICA ECAP threshold\t');fprintf(fid,'%3.2f\t',ary_data(2,:));fprintf(fid,'\n');
fprintf(fid,'64s ICA ECAP threshold\t');fprintf(fid,'%3.2f\t',ary_data(4,:));fprintf(fid,'\n');

ary_data=moving_icalab2('src42\','jadetd','Algorithm jadetd');
fprintf(fid,'jadetd\n');
fprintf(fid,'N Moving AVerage\t\t'); fprintf(fid,'%d\t\t',x);fprintf(fid,'\n');
fprintf(fid,'32s ICA ECAP threshold\t');fprintf(fid,'%3.2f\t',ary_data(2,:));fprintf(fid,'\n');
fprintf(fid,'64s ICA ECAP threshold\t');fprintf(fid,'%3.2f\t',ary_data(4,:));fprintf(fid,'\n');

ary_data=moving_icalab2('src42\','ewasobi','Algorithm ewasobi');
fprintf(fid,'ewasobi\n');
fprintf(fid,'N Moving AVerage\t\t'); fprintf(fid,'%d\t\t',x);fprintf(fid,'\n');
fprintf(fid,'32s ICA ECAP threshold\t');fprintf(fid,'%3.2f\t',ary_data(2,:));fprintf(fid,'\n');
fprintf(fid,'64s ICA ECAP threshold\t');fprintf(fid,'%3.2f\t',ary_data(4,:));fprintf(fid,'\n');

ary_data=moving_icalab2('src42\','wasobi','Algorithm wasobi');
fprintf(fid,'wasobi\n');
fprintf(fid,'N Moving AVerage\t\t'); fprintf(fid,'%d\t\t',x);fprintf(fid,'\n');
fprintf(fid,'32s ICA ECAP threshold\t');fprintf(fid,'%3.2f\t',ary_data(2,:));fprintf(fid,'\n');
fprintf(fid,'64s ICA ECAP threshold\t');fprintf(fid,'%3.2f\t',ary_data(4,:));fprintf(fid,'\n');

ary_data=moving_icalab2('src42\','thinica','Algorithm thinica');
fprintf(fid,'thinica\n');
fprintf(fid,'N Moving AVerage\t\t'); fprintf(fid,'%d\t\t',x);fprintf(fid,'\n');
fprintf(fid,'32s ICA ECAP threshold\t');fprintf(fid,'%3.2f\t',ary_data(2,:));fprintf(fid,'\n');
fprintf(fid,'64s ICA ECAP threshold\t');fprintf(fid,'%3.2f\t',ary_data(4,:));fprintf(fid,'\n');

ary_data=moving_icalab2('src42\','evd2','Algorithm evd2');
fprintf(fid,'evd2\n');
fprintf(fid,'N Moving AVerage\t\t'); fprintf(fid,'%d\t\t',x);fprintf(fid,'\n');
fprintf(fid,'32s ICA ECAP threshold\t');fprintf(fid,'%3.2f\t',ary_data(2,:));fprintf(fid,'\n');
fprintf(fid,'64s ICA ECAP threshold\t');fprintf(fid,'%3.2f\t',ary_data(4,:));fprintf(fid,'\n');

fclose(fid);
type aaa.txt;