function KB=CalcLinear(Qq,LengthX,LengthY)
GaussPoints=8;
GaussConstants=GetGC(GaussPoints);

            KB=zeros(8,8);

%Start the numerical integrration procedure
   for Xi=1:GaussPoints
     X = LengthX * (GaussConstants(2, Xi) + 1) / 2;
     for Yi=1:GaussPoints
         Y = LengthY * (GaussConstants(2, Yi) + 1) / 2;
            %**************************
            cm=CalcCm(X,Y);
            %**************************
            %performing the weighted summation
            KB=KB+GaussConstants(1,Xi)*GaussConstants(1,Yi)*cm'*Qq*cm;
            %End of Calculation loop body
      end
   end
   %Multiplying by the Jacobian
   KB=KB*LengthX*LengthY/4;