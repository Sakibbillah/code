%power spectral estimaion
clc;
clear all;
close all;
Fs = 1000;              
t = 0:1/Fs:1-1/Fs;      
x = 2*sin(2*pi*50*t) + 1.5*sin(2*pi*120*t);
N = length(x);          
X = fft(x);             
X_mag = abs(X).^2;      
PSD = X_mag / N;
f = (0:N-1)*(Fs/N);     
figure;
plot(f, PSD, 'LineWidth', 1.4);
xlabel('Frequency (Hz)');
ylabel('power Density Spectrum');
title('power Density Spectrum');
grid on;
xlim([0 Fs/2]);