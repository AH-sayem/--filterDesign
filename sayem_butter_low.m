clc ;
close all ;
clear all ;

alphap=4;
alphas=30;
fp=700;
fs=900;
f=6500
ohmp=(2*pi*fp)/f
ohms=(2*pi*fs)/f

[N,wn]=buttord(ohmp,ohms,alphap,alphas);
[B,A]=butter(N,wn,'low');
t=0:.01:pi;
[h,ohm]=freqz(B,A,t);
plot(ohm/pi,abs(h))
grid on ;