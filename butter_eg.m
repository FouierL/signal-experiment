clc;
clear;
Fs=20000;  %采样频率
T=1/Fs;  %周期
n=5;  %1Hz频率被分成n段
N=Fs*n;  %因为1Hz频率被分成了n段，所以频谱的x轴数组有Fs*n个数
f=(0:N-1)*Fs/N;  %将Fs个频率细分成Fs*n个
t =(0:N-1)*T;  %信号时长
nHz=6000;  %画的频谱的横坐标到nHz
Hz=nHz*n;  %画的频谱的横坐标的数组个数
x=sin(2*pi*20*t)+sin(2*pi*5000*t);
figure
subplot(221),plot(t,x,'k'),title('原始信号时域'),xlabel('time [s]');  %绘制原始信号时域
fx=abs(fft(x));  %傅里叶变换
subplot(222),plot(f(1:Hz), fx(1:Hz),'k'),title('原始信号频域'),xlabel('frequency [Hz]');  %绘制原始信号频域
%设置通带和阻带截止频率
fp=1000;
fs=4000;
Wp=2*pi*fp;
Ws=2*pi*fs;
%设置通带最大衰减和阻带最小衰减
Ap=3;
As=15;
%调用buttord函数
[n,Wn]=buttord(Wp,Ws,Ap,As,'s');
%设计滤波器
[B,A]=butter(n,Wn,'s');
%调用冲激响应不变法
[bz,az]=impinvar(B,A,Fs);
x1=filter(bz,az,x);
subplot(223),plot(t,x1,'k'),title('滤波信号时域'),xlabel('time [s]');  %绘制滤波信号时域
Fx=abs(fft(x1));  %傅里叶变换
subplot(224),plot(f(1:Hz), Fx(1:Hz),'k'),title('滤波信号频域'),xlabel('frequency [Hz]');  %绘制滤波信号频域
%%
ts=0.2;
fs=20000;
t=0:1/fs:ts;
ff=-0.5*fs:1/ts:0.5*fs;
x=sin(2*pi*20*t)+sin(2*pi*5000*t);
y=filter(bz,az,x);
X=fftshift(fft(x));
Y=fftshift(fft(y));
figure
subplot(2,2,1)
plot(t,x);
subplot(2,2,2)
plot(ff,abs(X));
subplot(2,2,3)
plot(t,y);
subplot(2,2,4)
plot(ff,abs(Y));