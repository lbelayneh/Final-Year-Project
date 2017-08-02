% Senjor Project: Software Defined Implementation of Digital Communication 
% Student: Leul Wuletaw
% Professor: Dr. Ing.- Dereje Hailemariam
% Date: June, 2017
% ***************** FUNCTION: modulator() ***************** %
% This function performs modulation before data transmission.

function [ data_out,data_out_length ] = modulator( int_in,string,order )

if strcmpi(string,'PAM')
    data_out=pammod(int_in,order);
elseif strcmpi(string,'PSK')
    data_out=pskmod(int_in,order);
elseif strcmpi(string,'QAM')
    data_out=qammod(int_in,order);
end

data_out_length=length(data_out);

end