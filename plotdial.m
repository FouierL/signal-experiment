[x,fs]=audioread('C:\Users\纳豆够巷\Desktop\工作\信号处理实验\2206113840.ogg');
n=length(x);
time=(0:n-1)/fs;
plot(time,x);
title('电话号码音频');xlabel('t/s');