%例4-9 课本P110  用傅里叶算法求信号的功率谱  信号长度为512 和1024
clf;Fs=1000;
%第一种情况：N=256
N=512;Nfft=512;  %数据长度和FFT所用的数据长度
n=0:N-1;t=n/Fs;  %采用的时间序列
%xn=sin(2*pi*50*t)+sin(2*pi*120*t);  %不带有噪声的信号
xn=sin(2*pi*50*t)+sin(2*pi*120*t)+randn(1,N);  %带有噪声的信号
Pxx=10*log10(abs(fft(xn,Nfft).^2/N));  %傅里叶振幅谱平方的平均值，并转换为dB
f=(0:length(Pxx)-1)*Fs/length(Pxx);  %给出频率序列
subplot(2,1,1),plot(f,Pxx);  %绘制功率谱曲线
xlabel('频率/Hz');ylabel('功率谱/dB');  %设置横纵坐标
title('周期图 N=512');grid on;  %设置表头，保留图像

%第二种情况：N=1024
Fs=1000;
N=1024;Nfft=1024;  %数据长度和FFT所用的数据长度
n=0:N-1;t=n/Fs;  %采用的时间序列
%xn=sin(2*pi*50*t)+sin(2*pi*120*t);  %不带有噪声的信号
xn=sin(2*pi*50*t)+sin(2*pi*120*t)+randn(1,N);  %带有噪声的信号
Pxx=10*log10(abs(fft(xn,Nfft).^2/N));  %傅里叶振幅谱平方的平均值，并转换为dB
f=(0:length(Pxx)-1)*Fs/length(Pxx);  %给出频率序列
subplot(2,1,2),plot(f,Pxx);  %绘制功率谱曲线
xlabel('频率/Hz');ylabel('功率谱/dB');  %设置横纵坐标
title('周期图 N=1024');grid on;  %设置表头，保留图像