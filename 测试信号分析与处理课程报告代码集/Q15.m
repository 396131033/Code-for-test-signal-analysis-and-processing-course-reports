%Q15  信号初相位改变对正弦信号的互相关函数的影响
clf;N=1000;Fs=1000;
n=0:N-1;t=n/Fs;
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

y2=0.5*sin(2*pi*10*t+90*pi/180);
[c2,lags2]=xcorr(x,y2,Lag,'unbiased');
subplot(2,2,3);plot(t,x,'r');
hold on;plot(t,y2,'b--');
legend('x信号','y2信号')
xlabel('时间/s');ylabel('x(t) y2(t)');
title('原始信号2');grid on;
hold off
subplot(2,2,4),plot(lags2/Fs,c2,'g');
xlabel('时间/s');ylabel('Rxy(t)');
title('信号x和y2的互有关');grid on