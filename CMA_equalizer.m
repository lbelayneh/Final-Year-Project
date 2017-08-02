% Senjor Project: Software Defined Implementation of Digital Communication 
% Code developer: Tewodros Amsalu
% Student: Leul Wuletaw
% Professor: Dr. Ing.- Dereje Hailemariam
% Date: June, 2017
% ***************** FUNCTION: CMA_equalizer() ******************* %
% This function equalizes received signals.

function [ES,W] = CMA_equalizer(RS,NL,MCP,R2,EL)

%%%%%%%%%%%%%%%%%%%%%%%%%%
% CMA Initialization
W=zeros(EL,1);
W(1) =1;

mu=0.0001;                         %step size

X = zeros(EL,1);
e = zeros(EL,1);


for i = EL:NL
    
    X(:,1) = RS(i:-1:i-EL + 1);
    	
    y = W'*X;
    %S(i) = y;
       
    yn = y/MCP;
    e = (abs(yn)^2 - R2)  ;
	ye = yn * e;
	W = W - mu * X * ye'  ;
     
end


ES(1:NL,1) = 0;
for i=EL:NL
   X(:,1) = RS(i:-1:i-EL +1).';
   ES(i,1)=W'*X;   
end 

end
