clf;
f1t=15;f2t=2;fs=100;N=100;N1=50;
n=0:N-1;
n1=0:N1-1;
t=n/fs;%时间序列
t1=n1/fs;
x=sin(2*pi*f1t*t)+sin(2*pi*f2t*t);
x1=sin(2*pi*f1t*t1)+sin(2*pi*f2t*t1);
y=fft(x,N);
y1=fft(x1,N1);
mag=(abs(y));%图像幅度谱，加log便于显示
mag1=(abs(y1));
f=n*fs/N;     %频率序列
f1=n1*fs/N1;     %频率序列
subplot(2,2,1),stem(f,mag);    %绘出随频率变化的振幅
xlabel('频率/Hz');
ylabel('振幅');title('N=100');grid on;
subplot(2,2,2),stem(f(1:N/2),mag(1:N/2)); %绘出Nyquist频率之前随频率变化的振幅
xlabel('频率/Hz');
ylabel('振幅');title('N=100');grid on;
subplot(2,2,3),stem(f1,mag1);    %绘出随频率变化的振幅
xlabel('频率/Hz');
ylabel('振幅');title('N=50');grid on;
subplot(2,2,4),stem(f1(1:N1/2),mag1(1:N1/2)); %绘出Nyquist频率之前随频率变化的振幅
xlabel('频率/Hz');
ylabel('振幅');title('N=50');grid on;