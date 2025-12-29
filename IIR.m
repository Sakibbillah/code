%%% IIR butterworth filter
clc;
clear;
close all;


Fs = 1000;                 
t = 0:1/Fs:1;              
x = sin(2*pi*50*t) + sin(2*pi*200*t) + sin(2*pi*400*t);


N = 4;                         
Wc_low  = 0.3;
Wc_high = 0.3;
Wc_band = [0.3 0.6];
Wc_stop = [0.3 0.6];


[b_low,  a_low]  = butter(N, Wc_low,  'low');
[b_high, a_high] = butter(N, Wc_high, 'high');
[b_band, a_band] = butter(N, Wc_band, 'bandpass');
[b_stop, a_stop] = butter(N, Wc_stop, 'stop');


y_low  = filter(b_low,  a_low,  x);
y_high = filter(b_high, a_high, x);
y_band = filter(b_band, a_band, x);
y_stop = filter(b_stop, a_stop, x);


[H_low,  f] = freqz(b_low,  a_low,  1024, Fs);
[H_high, f] = freqz(b_high, a_high, 1024, Fs);
[H_band, f] = freqz(b_band, a_band, 1024, Fs);
[H_stop, f] = freqz(b_stop, a_stop, 1024, Fs);


figure;
subplot(5,1,1);
plot(t, x); grid on;
title('Input Signal'); ylabel('Amplitude');

subplot(5,1,2);
plot(t, y_low); grid on;
title('Low Pass Output (Butterworth IIR)'); ylabel('Amplitude');

subplot(5,1,3);
plot(t, y_high); grid on;
title('High Pass Output (Butterworth IIR)'); ylabel('Amplitude');

subplot(5,1,4);
plot(t, y_band); grid on;
title('Band Pass Output (Butterworth IIR)'); ylabel('Amplitude');

subplot(5,1,5);
plot(t, y_stop); grid on;
title('Band Stop Output (Butterworth IIR)'); xlabel('Time (s)'); ylabel('Amplitude');


figure;
subplot(2,2,1);
plot(f, abs(H_low)); grid on;
title('Low Pass IIR (Butterworth)');
xlabel('Frequency (Hz)'); ylabel('|H(f)|');

subplot(2,2,2);
plot(f, abs(H_high)); grid on;
title('High Pass IIR (Butterworth)');
xlabel('Frequency (Hz)'); ylabel('|H(f)|');

subplot(2,2,3);
plot(f, abs(H_band)); grid on;
title('Band Pass IIR (Butterworth)');
xlabel('Frequency (Hz)'); ylabel('|H(f)|');

subplot(2,2,4);
plot(f, abs(H_stop)); grid on;
title('Band Stop IIR (Butterworth)');
xlabel('Frequency (Hz)'); ylabel('|H(f)|');