function val_n1p2=val_n1p2(input_signal)
MaxStart=31;MaxEnd=60;MinStart=11;MinEnd=30;
[MaxVal,MaxIdx]=max(input_signal(MaxStart:MaxEnd));
[MinVal,MinIdx]=min(input_signal(MinStart:MinEnd));
val_n1p2=abs(MaxVal-MinVal);