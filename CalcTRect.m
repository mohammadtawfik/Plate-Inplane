function Tinv=CalcTRect(Lx,Ly)
    
    T1=CalcHu(0,0);
    T2=CalcHv(0,0);
    T3=CalcHu(Lx,0);
    T4=CalcHv(Lx,0);
    T5=CalcHu(Lx,Ly);
    T6=CalcHv(Lx,Ly);
    T7=CalcHu(0,Ly);
    T8=CalcHv(0,Ly);
    
    Tt=[T1;T3;T5;T7;T2;T4;T6;T8];
    Tinv=inv(Tt);
endfunction  