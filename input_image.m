% Senjor Project: Software Defined Implementation of Digital Communication 
% Student: Leul Wuletaw
% Professor: Dr. Ing.- Dereje Hailemariam
% Date: June, 2017
% ***************** FUNCTION: input_image() ***************** %
% This function reads and stores image from external file.

function [ image_data, image_size] = input_image( file_path )

image_data=imread(file_path);
image_size=size(image_data);

if (numel(image_size)==2)
    image_length=image_size(1)*image_size(2);
elseif(numel(image_size)==3)
    image_length=image_size(1)*image_size(2)*image_size(3);
end

image_data=reshape(image_data,1,image_length);
end