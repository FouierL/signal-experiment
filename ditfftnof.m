%输入取样点数N0的L
L=input('请输入L:   ');
N0=2^L;
%补零
x0=[0:0.001:(N0-1)*0.001];
x=1.5*cos(2*pi*20*x0)+cos(2*pi*300*x0)+0.5*cos(2*pi*15*x0);
tic;
X=ditfft2(x,L);
toc;
function H=ditfft2(xn,M)
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
H=A;                                
end