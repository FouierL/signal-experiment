Wp=2*pi*1000;%通带截止频率,将数字频率化成模拟频率
Ws=2*pi*4000;%阻带截止频率,将数字频率化成模拟频率
Ap=3;%通带最大衰耗
As=15; %阻带最小衰耗
%求得阶数和3db截频wc
[N,Wc]=buttord(Wp,Ws,Ap,As,'s');
%B表示系统函数分子系数,A表示系统函数分母系数
[B,A]=butter(N,Wc,'s');%设计滤波器
omega=[Wp Ws]; %求出通带频率点和截止频率点对应的频率响应值
h=freqs(B,A,omega); %Compute Ap and As of AF
ap = -20*log10(abs(h(1)));% 将通带频率响应转换成衰耗值
as = -20*log10(abs(h(2)));% 将阻带频率响应转换成衰耗值
hp = abs(h(1));
hs = abs(h(2));
gain_p = 20*log10(abs(h(1))); 
gain_s = 20*log10(abs(h(2))); 
omega = [0:200:5000*2*pi];%指定一段频率值
h = freqs(B,A,omega);
subplot(211);
plot(omega/(2*pi),abs(h));
hold on;
plot([0 Wp/(2*pi)],[hp hp],'r--'); %画两个虚线
plot([Wp/(2*pi) Wp/(2*pi)],[0 hp],'r--');
plot([0 Ws/(2*pi)],[hs hs],'r--'); %画两个虚线
plot([Ws/(2*pi) Ws/(2*pi)],[0 hs],'r--');
hold off;
xlabel('频率'); 
ylabel('频率响应');
gain=20*log10(abs(h)); 
subplot(212);
plot(omega/(2*pi),gain);
hold on;%在画完函数虚线之后保持曲线图
plot([0 Wp/(2*pi)],[gain_p gain_p],'r--'); %画两个虚线
plot([Wp/(2*pi) Wp/(2*pi)],[0 gain_p],'r--');
plot([0 Ws/(2*pi)],[gain_s gain_s],'r--'); %画两个虚线
plot([Ws/(2*pi) Ws/(2*pi)],[0 gain_s],'r--');
hold off;
xlabel('频率'); 
ylabel('增益曲线');