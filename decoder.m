% Senjor Project: Software Defined Implementation of Digital Communication 
% Student: Leul Wuletaw
% Professor: Dr. Ing.- Dereje Hailemariam
% Date: June, 2017
% ***************** FUNCTION: decoder() ***************** %
% This function is used to decode received signal.

function  [decoded_signal]  = decoder( int_input,partition,codebook )

predictor=[0,-1];
decoded_signal=dpcmdeco(int_input,codebook,predictor);

lpf=fir1(10,0.05,'low');
decoded_signal=filter(lpf,1,decoded_signal);

end