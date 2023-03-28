%% 参数设置
clc;clear all;
C = 3e8;%光速
sigma = 50-1i*10;%介电常数
sigmar = 1; %相对介电常数
r = 0.0001;%半径/m
N = 10000;%频率采样点数
M = 70;%重复次数l=100
freq = linspace(1,100e9,N);%频率范围1—100GHz
lambda = C./freq;%波长
X = 2*pi*r*sqrt(real(sigmar))./lambda;%归一化周长
n = sqrt(sigma);
%% 计算各个有效因子
for j=1:N
    W0 = sin(X(j))+1i*cos(X(j));%W(0)
    W1 = cos(X(j))-1i*sin(X(j));%W(-1)
    A0 = cot(n)*X(j);
    W(1) = (1 /X(j))*W0-W1;
    A(1) = -1./(n*X(j))+1./(n*X(j)-A0);
    a(1) = ((A(1)/n+1/X(j))*real(W(1))-real(W0))/((A(1)/n+1/X(j))*W(1)-W0);
    b(1) = ((n*A(1)+1/X(j))*real(W(1))-real(W0))/((n*A(1)+1/X(j))*W(1)-W0);
    sigma_s(:,j) = 2/(X(j)^2)*3*((abs(a(1)))^2+(abs(b(1)))^2);
    sigma_e(:,j) = 2/(X(j)^2)*3*real(a(1)+b(1));
    sigma_b(:,j) = 1/(X(j)^2)*(abs((-1)*3*(a(1)-b(1)))^2);
    for l = 2:M
        if l==2
        W(l) = (3/X(j))*W(1)-W0;
        else
        W(l) = ((2*l-1) /X(j))*W(l-1)-W(l-2);
        end
        A(l) = -l/(n*X(j))+1/(n*X(j)-A(l-1));
        a(l) = ((A(l)/n+l/X(j))*real(W(l))-real(W(l-1)))/((A(l)/n+l/X(j))*W(l)-W(l-1));
        b(l) = ((n*A(l)+l/X(j))*real(W(l))-real(W(l-1)))/((n*A(l)+l/X(j))*W(l)-W(l-1));
        sigma_s(:,j) = sigma_s(:,j)+2/(X(j)^2)*(2*l+1)*(abs(a(l))^2+abs(b(l))^2);%散射
        sigma_e(:,j) = sigma_e(:,j)+2/(X(j)^2)*(2*l+1)*real(a(l)+b(l));%消光
        sigma_b(:,j) = sigma_b(:,j)+1/(X(j)^2)*(abs((-1)^(l)*(2*l+1)*(a(l)-b(l)))^2);%后向散射
    end
end