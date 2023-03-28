
%%
%后续代码
%%
%载入信号
[y1,Fs1]=audioread('C:\Users\纳豆够巷\Desktop\phone number1.mp3');
N=round(0.2*Fs1);
freq_indices = round(freq/Fs1*N) + 1; 
%%
%电话音设置
timeseries=1:N:length(y1);freq=[697,770,852,941,1209,1336,1477];
yin=[];
for i=1:length(timeseries)-1
yin=[yin;y1(timeseries(i):timeseries(i+1)-1)'];
end
%%
%滤波+计算频谱
yfinal=[y1(timeseries(length(timeseries)):length(y1))',zeros(1,N-(length(y1)-timeseries(length(timeseries)))-1)];
yin=[yin;yfinal]';
yout_f=[];
yin=filter(lvbo_dial2,yin);
yin=floor(1/max(abs(y1)))*yin;
for i=1:length(timeseries)
yout_f =[yout_f,goertzel(yin(:,i),freq_indices)];
end
yout_f=[zeros(1,length(timeseries));yout_f];
yout_f=[yout_f;zeros(1,length(timeseries))];
%%
%寻峰
peaks=[];
locations=[];
for i=1:length(timeseries)
    [peak,location]=findpeaks(abs(yout_f(:,i)),Fs1,'MinPeakHeight',10);
    peaks=[peaks,[peak;zeros(3-length(peak),1)]];
    locations=[locations,Fs1*[location;zeros(3-length(location),1)]];
end
%%
%结果载入
result=[];
for i=1:length(timeseries)
        this=findnumber(locations(:,i));
        result=[result,this];
end
%%
%输出
if length(result)>=2
output=[result(1)];
j=0;%判断是否存在连续的两个音
for i=2:length(result)
if result(i)~=result(i-1)
    output=[output,result(i)];
    j=0;
else 
    j=j+1;
end
if j>=5
    output=[output,result(i)];
    j=0;
end
end
else
    output=[];
end
clc
disp(output)