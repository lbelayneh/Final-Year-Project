% Senjor Project: Software Defined Implementation of Digital Communication 
% Code developer: Tewodros Amsalu
% Student: Leul Wuletaw
% Professor: Dr. Ing.- Dereje Hailemariam
% Date: June, 2017
% ***************** FUNCTION: MMA_equalizer() ******************* %
% This function performs equalization of received signals.

function [ES,W] = MMA_equalizer(RS,NL,MCP,R2r,R2i,EL)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CMA Initialization
%EL = 16;      % Equalizer length 
% CMA Initialization
W=zeros(EL,1);
W(1) =1;

mu=0.0001;                         %step size

X = zeros(EL,1);
e = zeros(EL,1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Initialization equalizer weight 

%W = zeros(EL,1);
%W(1,1) = 1;

%X(EL,1) = 0;

for i = EL:NL
    
    X(:,1) = RS(i:-1:i-EL + 1);
    	
    y = W'*X;
      
    yn = y/MCP;
    
    yReal = real(yn);
    yImag = imag(yn);
    
    eReal = yReal*(abs(yReal)^2 - R2r)  ;
    eImag = yImag*(abs(yImag)^2 - R2i)  ;
    
    %e = (abs(yn)^2 - R2)  ;
	%ye = yn * e;
	%W = W - mu * X * ye'  ;
    
    e = eReal + j * eImag; 
	W = W - mu * X * e'  ;
  
end


ES(1:NL,1) = 0;
for i=EL:NL
   X(:,1) = RS(i:-1:i-EL +1).';
   ES(i,1)=W'*X;   
end 

end

