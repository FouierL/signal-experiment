t1=zeros(1,7);
t2=zeros(1,7);
t3=zeros(1,7);
t4=zeros(1,7);
for i=0:6
    N=2^(6+i);
    k=rand(1,N);%里面是0-1的随机均匀分布的数
    tic;
    K=myFFT(k);
    toc;
    t1(1,i+1)=toc;
    tic;
    K=myDFT(k);
    toc;
    t2(1,i+1)=toc;
    tic;
    K=ditfft2(k,6+i);
    toc;
    t3(1,i+1)=toc;
    tic;
    K=fft(k);
    toc;
    t4(1,i+1)=toc;
end
N=[64 128 256 512 1024 2048 4096];
loglog(N,t1,'r');
title('myFFT红色myDFT蓝色mymymy绿色fft黑色');
xlabel('N序列长度');
ylabel('T运行时间');
hold on;
loglog(N,t2,'b'); 
hold on;
loglog(N,t3,'g'); 
hold on;
loglog(N,t4);
function X=myFFT(x)
x=x(:);%将x规范为列向量
N=length(x);
if N==1
X=x;
else
    X1=myFFT(x(1:2:N-1));
    X2=myFFT(x(2:2:N));
    X2=X2.*exp(-1j*2*pi*(0:N/2-1)'/N);
    X=[X1;X2];
end
end
function X=myDFT(x)
x=x(:);
N=length(x);
X=zeros(N,1);
W=exp(-1j*2*pi/N);
for k=1:N
for n=1:N
X(k)=X(k)+x(n)*W^((k-1)*(n-1));
end
end
end
function A=ditfft2(xn,M)
A=xn;
N=length(xn);
nxd=bin2dec(flip((dec2bin((1:N)-1,M)),2))+1;
xn=xn(nxd);
for i=1:N
    A(i)=xn(i);
end
for L = 1:M                               
    B = 2^(L-1);                        
    for J = 0:B-1                    
        P=2^(M-L)*J;
        for k=(J+1):2^L:N            
            W=exp(-i*2*pi*P/N);
            T=A(k)+A(k+B)*W;             
            A(k+B)=A(k)-A(k+B)*W;
            A(k)=T;
        end
    end
end                                
end