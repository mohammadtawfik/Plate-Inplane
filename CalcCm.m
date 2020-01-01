function Cm=CalcCm(x,y)

    Hux=CalcHux(x,y);
    Huy=CalcHuy(x,y);
    Hvx=CalcHvx(x,y);
    Hvy=CalcHvy(x,y);
    
    Cm=[Hux;Hvy;0.5*(Huy+Hvx)];
    
endfunction    