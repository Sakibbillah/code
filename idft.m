%%%  IDFT  %%%  
clc;
clear all;
close all;

X = [3, 2+1j, 1, 2-1j];   
N = length(X);

x = zeros(1, N);

for n = 0:N-1
    for k = 0:N-1
        x(n+1) = x(n+1) + (1/N)*X(k+1)*exp(1j*2*pi*k*n/N);
    end
end

disp('IDFT of signal x is:');
disp(x);

k = 0:N-1;
figure;
subplot(2,1,1);
stem(k, abs(x), 'filled');
title('Magnitude plot');
subplot(2,1,2);
stem(k, angle(x), 'filled');
title('Phase plot');
