% Senjor Project: Software Defined Implementation of Digital Communication 
% Student: Leul Wuletaw
% Professor: Dr. Ing.- Dereje Hailemariam
% Date: June, 2017
% ***************** FUNCTION: gradient_based() ***************** %
% This function performs symbol timing recovery during reception of a signal.

function [ sample_values,sample_points,shift ] = gradient_based( input_signal,constant )

len=round(length(input_signal)/100);
sample_points=zeros(1,len);
delta=50;
k=constant;
period=100;
sample_points(1)=75;

sample_values=zeros(1,len);
shift=zeros(1,len);
sample_values(1)=input_signal(sample_points(1));

for i=1:len-1
    
    shift(i)=k*real(input_signal(sample_points(i)))*real(input_signal(sample_points(i)+delta));
    
    sample_points(i+1)=round(sample_points(i)+shift(i)+period);
    sample_values(i+1)=input_signal(sample_points(i+1));
    
end

end
