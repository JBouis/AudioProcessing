// Program to compare the effect of length on window 
// on STFT using Hamming window

clc,clear,close,

[y,Fs]=wavread('C:\Test_Project\a-team_my_way.wav');
t=(0:length(y)-1)/Fs; // Changing x axis in to time in second
subplot(311)
plot(t,y)
xlabel('Time in seconds')
title('Original Signal')

beg=5200; // Sample at which window is to be applied
N=900; // Length of window in smaples
x=y(beg:beg+N-1);
whm=window('hm',N);  // Hamming window
Ham_seg=x.*whm; // Multiplying window with the signal
f_Ham= abs(fft(Ham_seg)); // Spectrum of the segment 
// using Hamming window
l=length(f_Ham)/2;
f=(0:(l-1))*Fs/(2*l); // Adjusting x axis to frequency
subplot(312)
plot(f,f_Ham(1:l))
title('Spectrum using Hamming Window with N=900')
xlabel('Frequency')
ylabel('Magnitude')
///// 
beg= 5200; // Sample at which window is to be applied
N= 300; // Length of window in samples
x=y(beg:beg+N-1);
whm= window('hm',N); // Hamming window
Ham_seg=x.*whm; // Multiplying window with the signal
f_Ham= abs(fft(Ham_seg)); // Spectrum of the segment using Hamming Window
l=length(f_Ham)/2;
f=(0:(l-1))*Fs/(2*l); // Adjusting x axis to Frequency
subplot(313)
plot(f,f_Ham(1:l))
title('Spectrum using Hamming Window with N=300')
xlabel('Frequency')
ylabel('Magnitude')

