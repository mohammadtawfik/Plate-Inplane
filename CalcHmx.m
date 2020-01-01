function Hm=CalcHmx(x,y)
   
    f0=0;
    f1=1;
    
    g0=1;
    g1=y;
    
    Hm=[f0*g0,f1*g0,f0*g1,f1*g1];
    
endfunction    