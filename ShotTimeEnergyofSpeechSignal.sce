// This Program computes the short time energy of a signal using
// Rectangular and Hamming window

clear,clc,close,

[y,Fs]=wavread('C:\Test_Project\a-team_my_way.wav');
t=(0:length(y)-1)/Fs; // Changing x axis in to time in second

subplot(311)
plot(t,y)
xlabel('Time in Seconds')
title('Original Signals')
frame_durn = 0.02; // Duration of frame in seconds
frame_len =15 //Fs*frame_durn; // Length of frame

Rect_window=window('re',frame_len);
frame_shift= Fs * frame_durn / 2; // 50% overlapping for
    // Rectangular window
num_of_frame= floor(length(y)/frame_shift);
    // Computing totale number of frames

frame_start= 1;
frame_end = frame_start + frame_len -1 ;
for j=1:num_of_frame
    En(j)=0;
    if frame_end >=length(y)    then   // Adjustement for       
                // the last segment
       frame_end=length(y)
       frame_len = frame_end-frame_start;
    end 
    
    segment=y(frame_start:frame_end);
    for k=1:frame_len
        En(j)=En(j)+(segment(k)*Rect_window(k))^2
       // Computing the STE
    end
    frame_start = frame_start+ frame_shift;
    frame_end= frame_end + frame_shift;
end

subplot(312)
plot(En)            
title('Short Time Energy using Rectangular window')
xlabel('Segment number')
ylabel('STE')

////////////////////////////////////////////////////////////

// For Hamming window
Ham_window = window('hm',frame_len);

frame_shift = Fs *frame_durn/4 ; // 75% overlapping
        // For Hamming window
num_of_frames= floor(length(y)/frame_shift);

frame_start = 1;
frame_end = frame_start +frame_len -1;
for j=1:num_of_frames
    En1(j)=0;
    if frame_end >=length(y) then
       frame_end = length(y)
       frame_len= frame_end - frame-start;
    end
    
    segment=y(frame_start:frame_end);
    for k=1:frame_len
        En1(j)=En1(j)+(segment(k)*Ham_window(k))^2
    end        // Computing STE using
    // Hamming window
    
    frame_start = frame_start +frame_shift;
    frame_end = frame_end + frame_shift;
           
end

subplot(313)
plot(En1)
title('Short Time Energy using Hamming window')
xlabel('Segment number')
ylabel('STE')
        
