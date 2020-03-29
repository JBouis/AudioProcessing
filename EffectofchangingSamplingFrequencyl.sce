// This code Reads an audio file and plys it by changing 
// the sampling frequency
clear,clc, close,
[y,Fs]= wavread('C:\Test_Project\a-team_my_way.wav');
//  read the audio file using the given path
Fs_new =Fs/.5; // Increasing Fs. Can be reduced by
// using command Fs_new=Fs/1.3;
sound(y,Fs_new); // Sound (2*y,Fs); can be used for better quality

t=(0:length(y)-1)*1/Fs;
tt=(0:length(y)-1)*1/Fs_new;
subplot(311)
plot(tt,y)
title('Original Sound')
 xlabel('Time in Seconds')
 ylabel('Amplitude')
subplot(312)
plot(t,y)
title('Effect of changing Sampling Frequency')
 xlabel('Time in Seconds')
 ylabel('Amplitude')
