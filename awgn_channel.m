% Senjor Project: Software Defined Implementation of Digital Communication 
% Student: Leul Wuletaw
% Professor: Dr. Ing.- Dereje Hailemariam
% Date: June, 2017
% ***************** FUNCTION: awgn_channel() ***************** %
% This function adds an AWGN over a data.

function [ data_out ] = awgn_channel( data_in,snr )

data_out=awgn(data_in,snr);

end