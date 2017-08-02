% Senjor Project: Software Defined Implementation of Digital Communication 
% Student: Leul Wuletaw
% Professor: Dr. Ing.- Dereje Hailemariam
% Date: June, 2017
% ***************** FUNCTION: file_browser() ***************** %
% This function performs browsing and selection of files.

function [ file_path ] = file_browser( string )

if (strcmp(string,'audio'))
    [filename,pathname]=uigetfile({'*.mp3'},'File Selector');
else
    [filename,pathname]=uigetfile({'*.gif';'*.jpg';'*.png'},'File Selector');
end
file_path=strcat(pathname,filename);
     
end 