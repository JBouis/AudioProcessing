// Program to fin effect of length of window
// on Short Time Autocorrelation Function ( STACF)
// using Rectangular window of different lengths

clc,close,clear,

[y,Fs]=wavread('C:\Test_Project\a-team_my_way.wav');

beg= 5200; // Sample at which window is to be applied
N= 800; // Length of window in samples
x=y(beg:beg+N-1); // Obtaining the required segment
wr=window('re',N); // Rectangular window
Rect_seg=x.*wr;
t=(beg:beg+N-1)/Fs; // Adjusting the x axis to time
subplot(221)
plot(t,Rect_seg)
xlabel('Time in seconds')
title('Selected segment in the signal with window of 800 samples')
c1=xcorr(Rect_seg); // Autocorrelation
lag=(1:length(c1))-ceil(length(c1)/2); // Adjusting x axis to get
    // peak at lag=0
subplot(223)
plot(lag,c1)
title('Short Time Autocorrelation using window of 800 samples')
xlabel('Lag k')
ylabel('STACF')
////////////////////////////
beg=5200; // Sample at which window is to be applied
N=300; // Length of window in samples
x=y(beg:beg+N-1); // Obtaining the required segment
wr=window('re',N);  // Rectangular Window
Rect_seg= x.*wr;

t=(beg:beg+N-1)/Fs; // Adjusting the x axis to time
subplot(222)
plot(t,Rect_seg)
xlabel('Time in seconds')
title('Selected segment in the signal with window of 300 smaples')
c1=xcorr(Rect_seg); // Autocorrelation
lag=(1:length(c1))-ceil(length(c1)/2); // Adjusting x axis to get
    // peak at lag=0
subplot(224)
plot(lag,c1)
title('Short Time Autocorrelation using window of 300 samples')
xlabel('Lag k')
ylabel('STACF')
