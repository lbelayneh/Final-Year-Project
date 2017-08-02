% Senjor Project: Software Defined Implementation of Digital Communication 
% Student: Leul Wuletaw
% Professor: Dr. Ing.- Dereje Hailemariam
% Date: June, 2017
% ***************** FUNCTION: early_late_gate() ***************** %
% This function performs symbol timing recovery during reception of a signal.

function [ sample_values,sample_points,shift ] = early_late_gate( input_signal,constant,samples_spacing )

len=round(length(input_signal)/100);
sample_points=zeros(1,len);
delta=samples_spacing;
k=constant;
period=100;
sample_points(1)=95;


sample_values=zeros(1,len);
shift=zeros(1,len);
sample_values(1)=input_signal(sample_points(1));

for i=1:len-1
    shift(i)=k*(abs(real(input_signal(sample_points(i)+delta)))^2 - (abs(real(input_signal(sample_points(i)-delta)))^2));
    sample_points(i+1)=round(sample_points(i)+shift(i))+period;
    sample_values(i+1)=input_signal(sample_points(i+1));
end

end
