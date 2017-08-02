% Senjor Project: Software Defined Implementation of Digital Communication 
% Student: Leul Wuletaw
% Professor: Dr. Ing.- Dereje Hailemariam
% Date: June, 2017
% ***************** FUNCTION: encoder() ***************** %
% This function is used to encode source signal (audio signal).

function  [encoded_signal]  = encoder( signal,partition,codebook )

predictor=[0,-1];
encoded_signal=dpcmenco(signal,codebook,partition,predictor);

end