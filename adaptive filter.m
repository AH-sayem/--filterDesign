clc ;
close all ;
clear all ;

f= input('Enter the frequency of the signal f=');
fs=input('Enter the sampling frequency (>=2f ) fs=');

% generation of input signal 
x=10*sin(2*pi*(f/fs))*[0:99];
n= randn(1,100);
nn=max(abs(n))

% output signal 

y=x+n;

% filter 
h = fir1(99, 0.25);
xs=y.*h;

e=x-xs;
pp=1;
ee=abs(e);
ee=max(ee);
while(ee>.1)
    for i=1:100
        hp(i)=h(i)+2*.025*y(i).*e(i);
        h(i)=hp(i);
        xs(i)=y(i).*h(i);
        e(i)=x(i)-xs(i);
    end
    pp=pp+1;
    ee=abs(e);
    ee=max(ee);
end
pp;
    figure
   subplot(2,2,1)
   plot(x)
   title('Input signal');
   xlabel('---->time(sec)')
   ylabel('-----> time(sec)')
   subplot(2,2,2)
   plot(n)
   title('Noise signal');
   xlabel('---->time(sec');
   ylabel('---->amp');
   subplot(2,2,3)
   plot(y)
   title('Noise added signal')
   xlabel('----time(sec)');
   ylabel('--->amp');
   subplot(2,2,4)
   plot(xs)
   title('Enhance signal');
   xlabel('----->time(sec)');
   ylabel('----->amp');