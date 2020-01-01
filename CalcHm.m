function Hm=CalcHm(x,y)
    
    f0=1;
    f1=x;
    
    g0=1;
    g1=y;
    
    Hm=[f0*g0,f1*g0,f0*g1,f1*g1];
    
endfunction    