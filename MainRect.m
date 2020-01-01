clear all
close all
clc
%Problem Data
Stiff=71e9;
Nu=0.3;
Thickness=0.0005;
GStiff=Stiff/2/(1+Nu);
LengthX=1;
LengthY=1;
Nx=2;
Ny=2;
Ne=Nx*Ny;
Nn=(Nx+1)*(Ny+1);
%Length of the elements in x and y-directions
Lx=LengthX/Nx;
Ly=LengthY/Ny;
%Evaluating the stiffness matrix 
T1=CalcTRect(Lx,Ly);
Dd=Stiff/(1-Nu*Nu);
Qq=[Dd,Nu*Dd,0; Nu*Dd,Dd,0; 0,0,2*GStiff];
KK=Thickness*T1'*CalcLinear(Qq,Lx,Ly)*T1;
[Nodes,Elements,BCs]=GenerateMesh(Nx,Ny,Lx,Ly);
BCs=[1;Nx+1;Nn+1;Nn+1+Nx]
%Creating Empty Global matrix
KGlobal=zeros(2*Nn,2*Nn);
%Looping on all elements
for ii=1:Ne
  for jj=1:4
    Nodej=Elements(ii,jj);
    Uj=Nodes(Nodej,3);
    Vj=Nodes(Nodej,4);
    for kk=1:4
      Nodek=Elements(ii,kk);
      Uk=Nodes(Nodek,3);
      Vk=Nodes(Nodek,4);
      %Assembling the global stiffness matrix 
      KGlobal(Uj,Uk)=KGlobal(Uj,Uk)+KK(jj,kk);
      KGlobal(Vj,Vk)=KGlobal(Vj,Vk)+KK(jj+4,kk+4);
      KGlobal(Uj,Vk)=KGlobal(Uj,Vk)+KK(jj,kk+4);
      KGlobal(Vj,Uk)=KGlobal(Vj,Uk)+KK(jj+4,kk);
    endfor
  endfor
end
BCsC=[1:2*Nn]';  %Complementary boundary conditions
BCsC(BCs)=[];
%The matrix that will be multiplied by the boundary values
KAux=KGlobal(:,BCsC);
KAux(BCsC,:)=[];
%Getting reduced stiffness and force vector 
%   by applying boundary conditions
KReduced=KGlobal;
KReduced(BCs,:)=[];
KReduced(:,BCs)=[];
%The right-hand-side vector 
FReduced=zeros(2*Nn,1);
FReduced(Nn)=10;
FReduced(2*Nn)=0;
FReduced(BCs)=[];
%Solving for the function values
Displacements=KReduced\FReduced
Reactions=KAux*Displacements