function Y=icalab3_algo(S,algo)
switch algo
        case {'ngfica'}
            Y=flexica(S)*S;
        case {'amuse'}
            Y=amuse(S)*S;
            %Y=swap_2d_array(Y);
        case {'jadeop'}
            Y=jadeop(S)*S;
            %Y=swap_2d_array(Y);
        case {'fjade'}
            Y=fjade(S)*S;
        case {'sobi'}
            Y=sobi(S)*S;
        case {'erica'}
            Y=erica(S)*S;
        case {'powerica'}
            Y=powerica(S,50,0.001)*S;
        case {'symwhite'}
            Y=symwhite(S)*S;
            %Y=swap_2d_array(Y);
        case {'multicombi'}
            Y=multicombi(S,10)*S;
        case {'fajdc4'}
            Y=fajdc4(S)*S;
        case {'qjade'}
            Y=qjade(S)*S;
        case {'jadetd'}
            Y=jade_td_p(S,2)*S;
            %Y=swap_2d_array(Y);
        case {'ewasobi'}
            Y=ewasobi(S,10,0.99)*S;
            %Y=swap_2d_array(Y);
        case {'wasobi'}
            Y=wasobi(S,10,0.99)*S;
            %Y=swap_2d_array(Y);
        case {'thinica'}
            Y=ThinICAnew(S,2)*S;
        case {'evd2'}
            Y=evd24(S)*S;
            %Y=swap_2d_array(Y);
    end