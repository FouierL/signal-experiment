clf;
f1=15;f2=2;
T=1e-3;N=2000;
T0=T*N;F0=1/T0;
t=T:T:T*N;
n=0:N-1;t1=n/fs;t2=n/fs;    %时间序列
x1=sin(2*pi*f1*t1);%信号
x2=sin(2*pi*f2*t2);
y1=fft(x1,N);%对信号进行快速Fourier变换
y2=fft(x2,N)
mag1=abs(y1);      %求得Fourier变换后的振幅
mag2=abs(y2);
f=n*fs/N;     %频率序列
subplot(2,3,1),stem(f,mag1);    %绘出随频率变化的振幅
xlabel('频率/Hz');
ylabel('振幅');grid on;
subplot(2,3,2),stem(f(1:N/2),mag1(1:N/2)); %绘出Nyquist频率之前随频率变化的振幅
xlabel('频率/Hz');
ylabel('振幅');grid on;
subplot(2,3,3),plot(t1,x1);    %绘出时域图像
xlabel('时间');
ylabel('x1');title('时域图像');grid on;
subplot(2,3,4),stem(f,mag2);    %绘出随频率变化的振幅
xlabel('频率/Hz');
ylabel('振幅');grid on;
subplot(2,3,5),stem(f(1:N/2),mag2(1:N/2)); %绘出Nyquist频率之前随频率变化的振幅
xlabel('频率/Hz');
ylabel('振幅');grid on;
subplot(2,3,6),plot(t2,x2);    %绘出时域图像
xlabel('时间');
ylabel('x2');title('时域图像');grid on;