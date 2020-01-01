function Hm=CalcHmy(x,y)
    
    f0=1;
    f1=x;
    
    g0=0;
    g1=1;
    
    Hm=[f0*g0,f1*g0,f0*g1,f1*g1];
    
endfunction    