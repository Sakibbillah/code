%%%  IFFT  %%% 
clc;
clear;
close all;
X = [8, 4-3i, 2, 4+3i];
N = length(X);
n = 0:N-1;
rev = bitrevorder(n) + 1;
X = X(rev);
stages = log2(N);
x = X;  
for s = 1:stages
    m = 2^s;                
    half_m = m / 2;
    Wm = exp(1j * 2*pi / m);

    for k = 1:m:N
        for j = 0:half_m-1
            t = Wm^j * x(k + j + half_m);
            u = x(k + j);
            x(k + j) = u + t;
            x(k + j + half_m) = u - t;
        end
    end
end
x = x / N;
disp('IFFT result using manual 4-point IFFT algorithm:');
disp(x);

