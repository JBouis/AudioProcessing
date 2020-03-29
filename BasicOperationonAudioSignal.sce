// This Code Reads an audio file and plays it

[y,Fs] = wavread('C:\Test_Project\a-team_my_way.wav');
 // read the audio file using the given path
 sound(y,Fs); // sound ( 2*y,Fs) can be used for better quality
 t=(0:length(y)-1)*1/Fs;
 plot(t,y);
 title('Speech signal waveform')'
 xlabel('Time in Seconds');
 ylabel('Amplitude');
