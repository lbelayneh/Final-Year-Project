% Senjor Project: Software Defined Implementation of Digital Communication 
% Student: Leul Wuletaw
% Professor: Dr. Ing.- Dereje Hailemariam
% Date: June, 2017
% ***************** FUNCTION: data_to_int() ***************** %
% This function converts an integer to data.

function [ data_out ] = int_to_data( int_in,bits,added)

len=length(int_in);
data_out=reshape(de2bi(int_in,bits,'left-msb'),1,len*bits);

size=length(data_out)-added;
data_out=data_out(1:size);
data_out=reshape(data_out,1,size);

end
