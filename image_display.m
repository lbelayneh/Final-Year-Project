% Senjor Project: Software Defined Implementation of Digital Communication 
% Student: Leul Wuletaw
% Professor: Dr. Ing.- Dereje Hailemariam
% Date: June, 2017
% ***************** FUNCTION: image_display() ***************** %
% This function is used to display image after reception.

function [  ] = image_display( image_data,image_size,plot_name )

if length(image_size)==2
    image_data=reshape(image_data,image_size(1),image_size(2));
    
elseif length(image_size)==3
    image_data=reshape(image_data,image_size(1),image_size(2),image_size(3));
end

imshowpair(image_data,image_data,'Parent',plot_name);

end