% Senjor Project: Software Defined Implementation of Digital Communication 
% Student: Leul Wuletaw
% Professor: Dr. Ing.- Dereje Hailemariam
% Date: June, 2017
% ***************** FUNCTION: counts_() ***************** %
% This function calculates the statistics of a set of signals.

function [ counts,len ] = counts_( int_in)

len=length(int_in);
maximum=max(int_in);

counts=zeros(1,maximum+1);
for i=1:len
    
    counts(int_in(i)+1)=counts(int_in(i)+1)+1;

end
        
end