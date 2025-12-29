%%%  FFT  %%% 
clc;
clear;
close all;
x = [1, 2, 3, 4, 4, 3, 2, 1];  
N = length(x);
n = 0:N-1;
rev = bitrevorder(n) + 1;  
x = x(rev);
stages = log2(N);
for s = 1:stages
    m = 2^s;                  
    half_m = m / 2;
    Wm = exp(-1j * 2 * pi / m);

    for k = 1:m:N
        for j = 0:half_m-1
            u = x(k + j);
            t = Wm^j * x(k + j + half_m);
            x(k + j) = u + t;
            x(k + j + half_m) = u - t;
        end
    end
end
disp('FFT result using Decimation-in-Time algorithm:');
disp(x);


