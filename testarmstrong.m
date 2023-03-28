clc;
[x, Fs] = audioread('C:\Users\纳豆够巷\Desktop\Armstrong.ogg');    %读取wav文件
sound(x,Fs);   %正常播放
pause(10);
y2 = filter(fivetituoyuan,x);% 直接使用设计好的滤波器进行滤波，filter函数是滤波函数
sound(y2,Fs);
subplot(2,2,1);
N=length(x);
time=(0:N-1)/Fs;  %计算时间坐标
plot(x);
xlabel('时间');
title('滤波前波形')
subplot(2,2,2);
fx=abs(fft(x));  %傅里叶变换
plot(fx);
xlabel('频率');
title('滤波前频域波形')
subplot(2,2,3);
plot(y2);
title('滤波后波形');
subplot(2,2,4);
f2=abs(fft(y2));  %傅里叶变换
plot(f2);
xlabel('频率');
title('滤波后频域波形');