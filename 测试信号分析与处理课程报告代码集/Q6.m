%Q6 信号的幅值改变对正弦信号的自相关函数的影响
clf;N=1000;Fs=1000;%数据长度和采样频率
n=0:N-1;t=n/Fs;%时间序列
Lag=100;%延迟样点数，限定返回值c的的长度2 x maxlags + 1
%randn('state',0);%设置产生随机数的初始状态
x1=sin(2*pi*10*t);%x1原始信号
x2=3*sin(2*pi*10*t);%x2原始信号
[c1,lags1]=xcorr(x1,Lag,'unbiased');%x1对原始信号进行无偏自相关估计
[c2,lags2]=xcorr(x2,Lag,'unbiased');%x2对原始信号进行无偏自相关估计

subplot(2,2,1),plot(t,x1);%绘原始信号X1
xlabel('时间/s');ylabel('x1(t)');title('幅值为1的周期信号');grid on;
subplot(2,2,2) ;plot(lags1/Fs,c1);%绘x1信号自相关，lags1/Fs为时间序列
xlabel('时间/s' );ylabel('Rx1(t)');
title('幅值为1的周期信号的自相关');grid on;

subplot(2,2,3),plot(t,x2);%绘原始信号X2
xlabel('时间/s');ylabel('x2(t)');title('幅值为3的周期信号');grid on;
subplot(2,2,4) ;plot(lags2/Fs,c2);%绘x2信号自相关，lags2/Fs为时间序列
xlabel('时间/s' );ylabel('Rx2(t)');
title('幅值为3的周期信号的自相关');grid on;