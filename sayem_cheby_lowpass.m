clc ;
close all ;
clear all ;


alphap=1 ;
alphas= 15 ;
wp=0.2*pi;
ws=.3*pi;

[n,wn]=cheb1ord(wp/pi,ws/pi,alphap,alphas)
[b,a]=cheby1(n,alphap,wn);
w=0:.01:pi;
[h,ph]=freqz(b,a,w);
m=20*log(abs(h));
an=angle(h);
title('Chebyshave filter');
subplot(2,1,1)
plot(ph/pi,m);
xlabel('Normalized frequency');
ylabel('Gain in db')
grid on;
subplot(2,1,2)
plot(ph/pi,an);
xlabel('Normalized frequency');
ylabel('phase in radian');
grid on ;

