
%sampling
clear all;
close all;
clc;
t=-5:0.01:5;
T=4;fm=1/T;
x=cos(2*pi*fm*t);
subplot(2,2,1);plot(t,x,'linewidth',3);
xlabel('time');ylabel('amplitude');
grid;
title('input signal');
n1=-5:1:5;
fs1=1.6*fm;
fs2=2*fm;
fs3=8*fm;
x1=cos(2*pi*fm/fs1*n1);
subplot(2,2,2);stem(n1,x1,'linewidth',3);
xlabel('number of samples');ylabel('amplitude');
hold on;
subplot(2,2,2);plot(n1,x1,'linewidth',3);
xlabel('time');ylabel('amplitude');
grid;
title('under sampling');
n2=-5:1:5;
x2=cos(2*pi*fm/fs2*n2);
subplot(2,2,3);stem(n2,x2,'linewidth',3);
xlabel('number of samples');ylabel('amplitude');
hold on;
subplot(2,2,3);plot(n2,x2,'linewidth',3);
xlabel('time');ylabel('amplitude');
grid;
title('uniform sampling');
n3=-5:1:5;
x3=cos(2*pi*fm/fs3*n3);
subplot(2,2,4);stem(n3,x3,'linewidth',3);
hold on;
subplot(2,2,4);plot(n3,x3,'linewidth',3);
xlabel('number of samples');ylabel('amplitude');
xlabel('time');ylabel('amplitude');
grid;
title('over sampling');
%.............................................................................
figure
 subplot(2,2,1)
 plot(abs(fftshift(fft(x))));
 subplot(2,2,2)
 plot(abs(fftshift(fft(x1))));
 subplot(2,2,3)
 plot(abs(fftshift(fft(x2))));
subplot(2,2,4)
 plot(abs(fftshift(fft(x3))));