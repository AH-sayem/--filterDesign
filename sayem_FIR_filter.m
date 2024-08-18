clc ;
close all ;
clear all ;

wc=.5*pi;
N=25 ;
alpha=(N-1)/2;
eps=.001;
n=0:1:N-1;
hd=(sin(wc*(n-alpha+eps)))./(pi*(n-alpha+eps));
% this  is for rectangular window 
wr=boxcar(N)
hn=wr'.*hd;
w=0:.01:pi;
h=freqz(hn,1,w)
plot(w/pi,abs(h))
hold on 
% this is for hamming window 
wn=hamming(N);
hn1=wn'.*hd;
h1=freqz(hn1,1,w)
plot(w/pi,abs(h1),'color','red')

% this section is for hanning window 
wn=hanning(N)
hn2=wn'.*hd;
h2=freqz(hn2,1,w)
plot(w/pi,abs(h2),'color','blue')

% this section is for backman window 
wb=blackman(N);
hn3=wb'.*hd;
h3=freqz(hn3,1,w)
plot(w/pi,abs(h3),'color','green')
grid on ;

xlabel('Normalized frequency');
ylabel('Amplitutte')
title('FIR designa using window method');

