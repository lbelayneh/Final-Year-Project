% Senjor Project: Software Defined Implementation of Digital Communication 
% Student: Leul Wuletaw
% Professor: Dr. Ing.- Dereje Hailemariam
% Date: June, 2017
% ***************** FUNCTION: passband_transmitter() ***************** %
% This function upconverts baseband signal to  a passband signal.

function [ transmitted_signal ] = passband_transmitter( baseband_signal,phase_offset )

len=length(baseband_signal);
%input signal frequency and sampling time to be used
fc=100000;
Ts=1/(10*fc);
t=(1:len).*Ts;


transmitted_signal=real(baseband_signal).*cos(2*pi*fc*t+phase_offset)+imag(baseband_signal).*sin(2*pi*fc*t+phase_offset);

end
