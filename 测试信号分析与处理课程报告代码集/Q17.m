%Q17  信号长度改变对正弦信号的互相关函数的影响
clf;N=256;Fs=1000;
n=0:N-1;t=n/Fs;

N2=1024;Fs=1000;%数据长度和采样频率
n2=0:N2-1;t2=n2/Fs;%时间序列

Lag=200;
x=sin(2*pi*10*t);
y1=0.5*sin(2*pi*10*t);
[c1,lags1]=xcorr(x,y1,Lag,'unbiased');
subplot(2,2,1);plot(t,x,'r');
hold on;plot(t,y1,'b--');
legend('x信号','y1信号')
xlabel('时间/s');ylabel('x(t) y1(t)');
title('原始信号1');grid on;
hold off
subplot(2,2,2),plot(lags1/Fs,c1,'g');
xlabel('时间/s');ylabel('Rxy(t)');
title('信号x和y1的互有关');grid on

x2=sin(2*pi*10*t2);
y2=0.5*sin(2*pi*10*t2);
[c2,lags2]=xcorr(x2,y2,Lag,'unbiased');
subplot(2,2,3);plot(t2,x2,'r');
hold on;plot(t2,y2,'b--');
legend('x信号','y2信号')
xlabel('时间/s');ylabel('x(t) y2(t)');
title('原始信号2');grid on;
hold off
subplot(2,2,4),plot(lags2/Fs,c2,'g');
xlabel('时间/s');ylabel('Rxy(t)');
title('信号x和y2的互有关');grid on