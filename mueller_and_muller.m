% Senjor Project: Software Defined Implementation of Digital Communication 
% Student: Leul Wuletaw
% Professor: Dr. Ing.- Dereje Hailemariam
% Date: June, 2017
% ***************** FUNCTION: mueller_and_muller() ***************** %
% This function performs symbol timing recovery during reception of a signal.

function [ sample_values,sample_points,shift ] = mueller_and_muller( input_signal,constant )

len=round(length(input_signal)/100);
sample_points=zeros(1,len);
delta=100;
k=constant;
period=100;
sample_points(1)=35;
sample_points(2)=135;

sample_values=zeros(1,len);
slicer=zeros(1,len);
shift=zeros(1,len);

sample_values(1)=real(input_signal(sample_points(1)));
sample_values(2)=real(input_signal(sample_points(2)));
slicer(1)= sign(sample_values(1));

for i=2:len-1
    slicer(i)=sign(real(input_signal(sample_points(i))));
    
    shift(i)= k*(slicer(i-1)*real(input_signal(sample_points(i))) - slicer(i)*real(input_signal(sample_points(i)-delta)));
    sample_points(i+1)=round(sample_points(i)+shift(i)+period);
    
    sample_values(i+1)=real(input_signal(sample_points(i+1)));
end

end
