t1=zeros(7,1);
t1=zeros(7,1);
for i=0:6
    N=2^(6+i);
    k=rand(1,N);%里面是0-1的随机均匀分布的数
    tic;
    K=myFFT(k);
    toc;
    t1(i,1)=toc;
    tic;
    K=myDFT(k);
    toc;
    t2(i,1)=toc;
end
subplot(2,2,1),loglog(N,t1);    %绘出随频率变化的振幅
xlabel('N序列长度');
ylabel('T1运行时间');title('myFFT');grid on;
subplot(2,2,2),stem(f(1:N/2),loglog(N,t2); %绘出Nyquist频率之前随频率变化的振幅
xlabel('N序列长度');
ylabel('T1运行时间');title('myDFT');grid on;