% Senjor Project: Software Defined Implementation of Digital Communication 
% Student: Leul Wuletaw
% Professor: Dr. Ing.- Dereje Hailemariam
% Date: June, 2017
% ***************** FUNCTION: derandomizer() ***************** %
% This function derandomizes received data.

function [ data_out ] = derandomizer( data_in,derandomizer )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

data_out=double(xor(data_in,derandomizer));

end