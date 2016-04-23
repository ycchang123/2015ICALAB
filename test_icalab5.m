%test icalab5.m
%different_signal=0;
%for i=1:16
%    for j=1:18
%        for k=1:15
%            if data2(i,j).data(k).cuLevel ~= rdata(i,j,k).cuLevel
%                different_signal=1;
%            end
%            if data2(i,j).data(k).filter_ecapICA32 ~= rdata(i,j,k).ISL32
%                different_signal=1;
%            end
%            
%        end
%    end
%end
%disp(different_signal);
for k=4:9
    disp (data2(3,4).data(k).filter_ecapICA32(30));
    disp (rdata(3,4,k).ILS32(30));
end
