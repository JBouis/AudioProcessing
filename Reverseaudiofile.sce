// This code Reads an audio file and plays it by reversing the file

[y,Fs]=wavread('C:\Test_Project\a-team_my_way.wav');
// Give the Path
z=y(:,$:-1:1); // Reversing the file

sound(z,Fs); // Sound( 2*y, Fs); can be used for better quality
t=(0:length(z)-1)*1/Fs;
plot(t,z)
title('Reverses File')
xlabel('Time in seconds')
ylabel('Amplitude')
