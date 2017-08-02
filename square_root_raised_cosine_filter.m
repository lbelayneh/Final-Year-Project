% Senjor Project: Software Defined Implementation of Digital Communication 
% Student: Leul Wuletaw
% Professor: Dr. Ing.- Dereje Hailemariam
% Date: June, 2017
% ***************** FUNCTION: square_root_raised_cosine_filter() ***************** %
% This function implements pulse shaping and matched filtering 
% at transmitter and receiver respectively.

function [ output_signal ] = square_root_raised_cosine_filter( input_signal,string )

beta=1;%rolloff factor
span=4;%number of symbols
    
SRRC_filter=rcosdesign(beta,span,50);

if strcmp(string,'tx')
    output_signal=upfirdn(input_signal,SRRC_filter,100);
elseif strcmp(string,'rx')
    output_signal=upfirdn(input_signal,SRRC_filter,1);
    len=length(output_signal);
    output_signal=output_signal(150:len-150);
end


end
