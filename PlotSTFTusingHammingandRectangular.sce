//This Program plots the spectrum of a segment
// of a given signal obtained using Rectangular and Hamming Window

clc;close;clear;

[y,Fs]=wavread('C:\Test_Project\a-team_my_way.wav');
t=(0:length(y)-1)/Fs;
subplot(311)
plot(t,y)
xlabel('Time in Seconds')
title('Original Signal')
//
beg=5200; // Sample at which window is to be applied
N=500; // Length of window in samples
x=y(beg:beg+N-1);
whm= window('hm',N);  // Hamming window
Ham_seg=x.*whm; // Multiplying window with the signal
//
wr=window('re',N); // Rectangular window
Rect_seg=x.*wr;
f_Rect=abs(fft(Rect_seg)); // Spectrum of the segment using
    // Rectangular Window
f_Ham=abs(fft(Ham_seg)); // Spectrum of the segment using
    // Hamming window
l=length(f_Ham)/2;
f=(0:(l-1))*Fs/(2*1); // Adjusting x axis to frequency
//
subplot(3,1,2)
plot(f,f_Ham(1:1))
title('Spectrum using Hamming Window')
xlabel('Frequency')     
ylabel('Magnitude')
//
subplot(313)
plot(f,f_Rect(1:1))
title('Soectrum using Rectangular Window')
ylabel('Magnitude')
xlabel('Frequency')   

