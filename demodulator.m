% Senjor Project: Software Defined Implementation of Digital Communication 
% Student: Leul Wuletaw
% Professor: Dr. Ing.- Dereje Hailemariam
% Date: June, 2017
% ***************** FUNCTION: demodulator() ***************** %
% This function performs demodulation of received data.

function [ int_out ] = demodulator( data_in,string,order )
if strcmpi(string,'PAM')
    int_out=pamdemod(data_in,order);
elseif strcmpi(string,'PSK')
    int_out=pskdemod(data_in,order);
elseif strcmpi(string,'QAM')
    int_out=qamdemod(data_in,order);
end

end