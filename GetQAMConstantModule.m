% Senjor Project: Software Defined Implementation of Digital Communication 
% Code developer: Tewodros Amsalu
% Student: Leul Wuletaw
% Professor: Dr. Ing.- Dereje Hailemariam
% Date: June, 2017
% ***************** FUNCTION: GetQAMConstantModule() ******************* %
% This function calculates the mean constellation points of
% received signals and provides for CMA equalizer.
 
function [R2,MCP] = GetQAMConstantModule(M)

d = log2(M);
% Calculate R2
conPonintR=-(d-1):2:(d-1); 	   % constellation point real 
conPonintI=conPonintR*1i;           % constellation point ima 
conPoints= zeros(d^2,1);       
I=0;
for z=1:d
    for q=1:d
        I=I+1;
       conPoints(I)=conPonintR(q)+conPonintI(z);
    end
end

MeanConPoints = sqrt(mean(abs(conPoints).^2));
conPoints=conPoints/MeanConPoints;
R2=mean(abs(conPoints).^4)/mean(abs(conPoints).^2);
MCP = MeanConPoints;

end

