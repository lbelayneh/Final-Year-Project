% Senjor Project: Software Defined Implementation of Digital Communication
% Student: Leul Wuletaw
% Professor: Dr. Ing.- Dereje Hailemariam
% Date: June, 2017
% ***************** FUNCTION: costas_carrier_recovery() ***************** %
% This function performs carrier recovery during signal reception.

function [ phase_estimate ] = costas_carrier_recovery( received_signal,mod_scheme,filter_constant,filter_cutoff )

len=length(received_signal);
%input signal frequency and sampling time to be used
fc=100000;
Ts=1/(10*fc);
t=(1:len).*Ts;

%vector for holding the phased difference between the incoming signal and
%VCO generated signal
phase_difference=ones(1,len);

%the two quadrature components of the costas loop and their phase
phase_estimate=zeros(1,len);

signal_I=cos(2*pi*fc*t+phase_estimate);
signal_Q=sin(2*pi*fc*t+phase_estimate);

k=filter_constant;
h=filter_cutoff;

%design of Loop filter numerator and denominator values
b=k;
a=[1,-1];

%final state holder for the loop filter
Zf=zeros(max(numel(a,b)),1);

%design of the three low-pass filter and vectors for holding the filters' state
lpf=fir1(10,h,'low');
Zl_I=zeros(numel(lpf)-1,1);
Zl_Q=zeros(numel(lpf)-1,1);
Zl_L=zeros(numel(lpf)-1,1);

if strcmpi(mod_scheme,'qam')
    %Loop filter coefficient (gain)
    Kl=0.1;
    
    for i=1:len
        
        %the Inphase and Quadrature compnents generated for the Costas loop
        signal_Q(i)=sin(2*pi*fc*i*Ts+phase_estimate(i));
        signal_I(i)=cos(2*pi*fc*i*Ts+phase_estimate(i));
        
        %low pass filter after the inphase input
        mul=signal_I(i)*received_signal(i);
        [mul_out_I,Zl_I]=filter(lpf,1,mul,Zl_I);
        
        %low pass filter after the quadrature input
        mul_2=signal_Q(i)*received_signal(i);
        [mul_out_Q,Zl_Q]=filter(lpf,1,mul_2,Zl_Q);
        
        %decisions from the two quadratures
        decision_I=sign(mul_out_I);
        decision_Q=sign(mul_out_Q);
        
        %loop filter of the PLL
        phase_difference(i)=Kl*((decision_Q*mul_out_I-decision_I*mul_out_Q));
        
        %low pass filter before the loop filter
        [phase_difference(i),Zl_L]=filter(lpf,1,phase_difference(i),Zl_L);
        
        [phase_estimate(i+1),Zf]=filter(b,a,phase_difference(i),Zf);
        
    end
    
elseif strcmpi(mod_scheme,'pam')
    %Loop filter coefficient (gain)
    Kl=10;
    
    for i=1:len
        
        %the Inphase and Quadrature compnents generated for the Costas loop
        signal_I(i)=-sin(2*pi*fc*i*Ts+phase_estimate(i));
        signal_Q(i)=cos(2*pi*fc*i*Ts+phase_estimate(i));
        
        %low pass filter after the inphase input
        mul=signal_I(i)*received_signal(i);
        [mul_out_I,Zl_I]=filter(lpf,1,mul,Zl_I);
        
        %low pass filter after the quadrature input
        mul_2=signal_Q(i)*received_signal(i);
        [mul_out_Q,Zl_Q]=filter(lpf,1,mul_2,Zl_Q);
        
        %loop filter of the Costas Loop
        phase_difference(i)=Kl*(mul_out_I*mul_out_Q);
        
        %low pass filter before the loop filter
        [phase_difference(i),Zl_L]=filter(lpf,1,phase_difference(i),Zl_L);
        
        [phase_estimate(i+1),Zf]=filter(b,a,phase_difference(i),Zf);
        
    end
    
end

end