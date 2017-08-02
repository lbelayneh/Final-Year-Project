% Senjor Project: Software Defined Implementation of Digital Communication 
% Student: Leul Wuletaw
% Professor: Dr. Ing.- Dereje Hailemariam
% Date: June, 2017
% ***************** FUNCTION: fading_channel() ***************** %
% This function acts as a fading channel.

function [ data_out,len ] = fading_channel( data_in, channel_type )

if strcmp(channel_type,'Measured Channel')
    channel_filter_coefficients = [0.9656,-0.0906,0.0578,0.2368];
elseif strcmp(channel_type,'JTC Channel')
    channel_filter_coefficients =[0.660693448,0.436515832,0.28840315,0.190546072,0.125892541,0.083176377,0.054954087];
elseif strcmp(channel_type,'Exponential Channel') % Exponential Model
    channel_filter_coefficients =[0.900628309883934,0.391411450006315,0.170106714961902, 0.0739280735774670, 0.0321290083351466,0.0139632094635637,0.00606838581787387];
elseif strcmp(channel_type,'With Phase Shift')
    channel_filter_coefficients =[0.805546449344489 + 0.402773224672244i,0.350089043754353 + 0.175044521877176i, 0.152148071233598 + 0.0760740356167989i,0.0661232791859289 + 0.0330616395929645i,0.0287370586748181 + 0.0143685293374090i, 0.0124890742178387 + 0.00624453710891936i,0.00542772928098465 + 0.00271386464049232i];                   
elseif strcmp(channel_type,'No Fading')
    channel_filter_coefficients =[1,0,0,0];                  
end

len=length(channel_filter_coefficients);
data_out = filter(channel_filter_coefficients,1,data_in);

end