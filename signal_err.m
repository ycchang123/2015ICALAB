function err=signal_err(vector,index_begin,index_end)
len=length(vector);
if (index_end-index_begin+1)<=len
    for i = index_begin:index_end
        vector1(i)=abs(abs(vector(1,i))-abs(vector(2,i)));
    end
end
err=sum(vector1);

