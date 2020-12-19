%Q3 信号长度改变对正弦信号的自相关函数的影响
clf;N=256;Fs=1000;%数据长度和采样频率
n1=0:N-1;t1=n1/Fs;%时间序列

N2=1024;Fs=1000;%数据长度和采样频率
n2=0:N2-1;t2=n2/Fs;%时间序列

Lag=100;%延迟样点数，限定返回值c的的长度2 x maxlags + 1
%randn('state',0);%设置产生随机数的初始状态
x1=sin(2*pi*10*t1);%x1原始信号
x2=sin(2*pi*10*t2);%x2原始信号
[c1,lags1]=xcorr(x1,Lag,'unbiased');%x1对原始信号进行无偏自相关估计
[c2,lags2]=xcorr(x2,Lag,'unbiased');%x2对原始信号进行无偏自相关估计

subplot(2,2,1),plot(t1,x1);%绘原始信号X1
xlabel('时间/s');ylabel('x1(t)');title('x1周期信号');grid on;
subplot(2,2,2) ;plot(lags1/Fs,c1);%绘x1信号自相关，lags1/Fs为时间序列
xlabel('时间/s' );ylabel('Rx1(t)');
title('x1周期信号的自相关');grid on;

subplot(2,2,3),plot(t2,x2);%绘原始信号X2
xlabel('时间/s');ylabel('x2(t)');title('x2周期信号');grid on;
subplot(2,2,4) ;plot(lags2/Fs,c2);%绘x2信号自相关，lags2/Fs为时间序列
xlabel('时间/s' );ylabel('Rx2(t)');
title('x2周期信号的自相关');grid on;