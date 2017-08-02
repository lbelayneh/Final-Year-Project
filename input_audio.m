% Senjor Project: Software Defined Implementation of Digital Communication 
% Student: Leul Wuletaw
% Professor: Dr. Ing.- Dereje Hailemariam
% Date: June, 2017
% ***************** FUNCTION: input_audio() ***************** %
% This function reads and stores audio from external file.

function [ audio_data ] = input_audio( file_path,size )

size=size*5.5125;
size=size+100000;
samples=[100001,size];

[y,~]=audioread(file_path,samples);
audio_data=y(:,1);

len=length(audio_data);
audio_data=audio_data(1:5.5125:len);

end