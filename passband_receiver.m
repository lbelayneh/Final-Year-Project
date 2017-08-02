% Senjor Project: Software Defined Implementation of Digital Communication 
% Student: Leul Wuletaw
% Professor: Dr. Ing.- Dereje Hailemariam
% Date: June, 2017
% ***************** FUNCTION: passband_receiver() ***************** %
% This function downconverts passband signal to  a basebandband signal.

function [ baseband_signal ] = passband_receiver( received_signal,phase_estimate )

len=length(received_signal);
%input signal frequency and sampling time to be used
fc=100000;
Ts=1/(10*fc);
fc=100000;
t=(1:len).*Ts;

%design of the low-pass filter 
lpf=fir1(10,0.05,'low');

baseband_signal=real(received_signal.*cos(2*pi*fc*t+phase_estimate(1:len)))+j*real(received_signal.*sin(2*pi*fc*t+phase_estimate(1:len)));
baseband_signal=filter(lpf,1,baseband_signal);

end