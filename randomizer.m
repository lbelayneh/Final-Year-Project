% Senjor Project: Software Defined Implementation of Digital Communication 
% Student: Leul Wuletaw
% Professor: Dr. Ing.- Dereje Hailemariam
% Date: June, 2017
% ***************** FUNCTION: randomizer() ***************** %
% This function randomizes data before transmission.

function [ data_out,randomizer_data ] = randomizer( data_in )

randomizer_data=randi([0,1],1,length(data_in));
data_out=double(xor(data_in,randomizer_data));

end