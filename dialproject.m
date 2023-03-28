f1=697;
f2=770;
f3=852;
f4=941;
F1=1209;
F2=1336;
F3=1477;
T0=1;
fs=8000;
N=T0*fs;
dt=1/fs;
t=(0:N-1)*dt;
k1=sin(2*pi*f1*t)+sin(2*pi*F1*t);
k2=sin(2*pi*f1*t)+sin(2*pi*F2*t);
k3=sin(2*pi*f1*t)+sin(2*pi*F3*t);
k4=sin(2*pi*f2*t)+sin(2*pi*F1*t);
k5=sin(2*pi*f2*t)+sin(2*pi*F2*t);
k6=sin(2*pi*f2*t)+sin(2*pi*F3*t);
k7=sin(2*pi*f3*t)+sin(2*pi*F1*t);
k8=sin(2*pi*f3*t)+sin(2*pi*F2*t);
k9=sin(2*pi*f3*t)+sin(2*pi*F3*t);
km=sin(2*pi*f4*t)+sin(2*pi*F1*t);
k0=sin(2*pi*f4*t)+sin(2*pi*F2*t);
kj=sin(2*pi*f4*t)+sin(2*pi*F3*t);
key=['1','2','3';'4','5','6';'7','8','9';'*','0','#'];
k=[18,20,22,24,31,34,38,42];
num=input('please enter the key:','s');
num=num-48;
n=length(num);
disp('The number of the key is: ');
disp(n);
number=zeros(n,length(t));
for i=1:n
switch num(i)
case 1
number(i,1:N)=k1;
case 2
number(i,1:N)=k2;
case 3
number(i,1:N)=k3;
case 4
number(i,1:N)=k4;
case 5
number(i,1:N)=k5;
case 6
number(i,1:N)=k6;
case 7
number(i,1:N)=k7;
case 8
number(i,1:N)=k8;
case 9
number(i,1:N)=k9;
case 0
number(i,1:N)=k0;
case -6
number(i,1:N)=km;
case -13
number(i,1:N)=kj;
otherwise
error('The key is not right!');
end
end
for i=1:n
soundsc(number(i,1:N),fs,24);
pause(T0);
end