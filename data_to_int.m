% Senjor Project: Software Defined Implementation of Digital Communication 
% Student: Leul Wuletaw
% Professor: Dr. Ing.- Dereje Hailemariam
% Date: June, 2017
% ***************** FUNCTION: data_to_int() ***************** %
% This function converts a data to integer.

function [ int_out,added ] = data_to_int( data_in,bits )

size=length(data_in);
remainder=rem(size,bits);
added=bits-remainder;

%if remainder is zero, then none has to added at the end of the data
if remainder==0
    added=0;
end

modified_input=cat(2,data_in,zeros(1,added));
int_out=bi2de(reshape(modified_input,length(modified_input)/bits,bits),'left-msb');

len=length(int_out);
int_out=reshape(int_out,1,len);

end
