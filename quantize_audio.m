% Senjor Project: Software Defined Implementation of Digital Communication 
% Student: Leul Wuletaw
% Professor: Dr. Ing.- Dereje Hailemariam
% Date: June, 2017
% ***************** FUNCTION: quantize_audio() ***************** %
% This function perfroms audio signal quantization.

function [ partition,codebook ] = quantize_audio( audio_data,bits,string )

if strcmp(string,'normal')
    b=bits-1;
    partition=-1+1/2^b:1/2^b:1-1/2^b;
    codebook=-1+1/2^b:1/2^b:1;

elseif strcmp(string,'optimized')
    [partition,codebook]=lloyds(audio_data,2^bits);

end


end