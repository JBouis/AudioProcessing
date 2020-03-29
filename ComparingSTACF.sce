// Program to fin short Time Autocorrelation Function
// Using Rectangular and Hamming window


clear,close,clear,

[y,Fs]=wavread('C:\Test_Project\a-team_my_way.wav');

beg= 5200; // Sample at which window is to be applied
N= 500; // Length of window in Sample
x=y(beg:beg+N-1); // Obtainin the required segment

whm= window('hm',N); // Hamming window
Ham_seg=x.*whm; // Multiplying window with the signal

wr=window('re',N);// Rectangular Window
Rect_seg=x.*wr;

t=(beg:beg+N-1)/Fs; // Adjusting the x axis to time
subplot(311)
plot(t,Rect_seg)
xlabel('Time in seconds')
title('Selected segment in the signal')
c1= xcorr(Rect_seg); // Autocorrelation
lag=(1:length(c1))-ceil(length(c1)/2);
   // Adjusting x axis to get peak at lag=0
subplot(312)
plot(lag,c1)
title('Short Time Autocorrelation using Rectangular window')
xlabel(' Lag k')
ylabel('STACF')
//////////////////
c2=xcorr(Ham_seg);
lag=(1:length(c1))-ceil(length(c2)/2); // Adjusting x axis
    // to get peak at lag=0
subplot(313)
plot(lag,c2)
title('Short Time Autocorrelation using Hamming window')
xlabel('Lag k')
ylabel('STACF')
       
