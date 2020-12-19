%Q8 信号的初相位改变对正弦信号的功率谱的影响
clf;Fs=1000;
%第一种情况：N=256
N=1024;Nfft=1024;  %数据长度和FFT所用的数据长度
n=0:N-1;t=n/Fs;  %采用的时间序列
x1=sin(2*pi*100*t);  %不带有噪声的信号
%xn=sin(2*pi*50*t)+sin(2*pi*120*t)+randn(1,N);  %带有噪声的信号
Pxx1=10*log10(abs(fft(x1,Nfft).^2/N));  %傅里叶振幅谱平方的平均值，并转换为dB
f1=(0:length(Pxx1)-1)*Fs/length(Pxx1);  %给出频率序列
% subplot(2,2,1),plot(t,x1);%绘原始信号X1
% % xlabel('时间/s');ylabel('x1(t)');title('幅值为1的周期信号');grid on;
subplot(2,1,1),plot(f1,Pxx1);  %绘制功率谱曲线
xlabel('频率/Hz');ylabel('功率谱/dB');  %设置横纵坐标
title('周期图 初相位0°');grid on;  %设置表头，保留图像

%第二种情况：N=1024
Fs=1000;
N=1024;Nfft=1024;  %数据长度和FFT所用的数据长度
n=0:N-1;t=n/Fs;  %采用的时间序列
x2=sin(2*pi*100*t + 90*pi/180);  %不带有噪声的信号
%xn=sin(2*pi*50*t)+sin(2*pi*120*t)+randn(1,N);  %带有噪声的信号
Pxx2=10*log10(abs(fft(x2,Nfft).^2/N));  %傅里叶振幅谱平方的平均值，并转换为dB
f2=(0:length(Pxx2)-1)*Fs/length(Pxx2);  %给出频率序列
% subplot(2,2,3),plot(t,x2);%绘原始信号X1
% xlabel('时间/s');ylabel('x1(t)');title('幅值为1的周期信号');grid on;
subplot(2,1,2),plot(f2,Pxx2);  %绘制功率谱曲线
xlabel('频率/Hz');ylabel('功率谱/dB');  %设置横纵坐标
title('周期图 初相位90°');grid on;  %设置表头，保留图像