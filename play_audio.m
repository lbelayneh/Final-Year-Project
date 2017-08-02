% Senjor Project: Software Defined Implementation of Digital Communication 
% Student: Leul Wuletaw
% Professor: Dr. Ing.- Dereje Hailemariam
% Date: June, 2017
% ***************** FUNCTION: play_audio() ***************** %
% This function plays audio file using the PC soundcard.

function [  ] = play_audio( audio_data )

Fs=8000;
soundsc(audio_data,Fs);

end