% Senjor Project: Software Defined Implementation of Digital Communication 
% Student: Leul Wuletaw
% Professor: Dr. Ing.- Dereje Hailemariam
% Date: June, 2017
% ***************** FUNCTION: image_compare() ***************** %
% This function is used to display an image.

function [  ] = image_compare( image_data,image_data_1,image_size )

if length(image_size)==2
image_data=reshape(image_data,image_size(1),image_size(2));
image_data_1=reshape(image_data_1,image_size(1),image_size(2));
elseif length(image_size)==3
image_data=reshape(image_data,image_size(1),image_size(2),image_size(3));
image_data_1=reshape(image_data_1,image_size(1),image_size(2),image_size(3));
end

imshowpair(image_data,image_data_1);

end