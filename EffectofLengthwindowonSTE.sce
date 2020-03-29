// This program shows the effect of window length on STE

clc, close,clear,

[y,Fs]=wavread('C:\Test_Project\a-team_my_way.wav');
t=(0:length(y)-1)/Fs ; // Changing x axis in to time
    // in seconds
subplot(311)
plot(t,y)
xlabel('Time in Second')
title('Original signal')
frame_durn = 0.025; // Duration of frame 
    // in seconds
frame_len=40; //Fs *frame_durn; // Length of frame
Rect_window = window('re',frame_len);
frame_shift = Fs * frame_durn/2; // 50% overlapping
   // for Rectangular window
num_of_frames= floor(length(y)/frame_shift);
 // Computing total number of frames
frame_start = 1;
frame_end = frame_start + frame_len -1;
for j=1:num_of_frames
    En(j)=0;
    if frame_end >= length(y) then  // Adjustment for
         // the last semgent
         frame_end= length(y)
         frame_len = frame_end- frame_start;
    end
    segment=y(frame_start:frame_end);
    for k=1:frame_len
        En(j)=En(j)+(segment(k)*Rect_window(k))^2 
        // Computing the STE
    end          
    frame_start= frame_start + frame_shift;
    frame_end = frame_end + frame_shift;
end
subplot(312)
plot(En)    
title('Short Time Energy using window of 25ms')
xlabel('Segment number')
ylabel('STE')
//////
frame_durn = 0.04; // Duration of frame
    // in seconds
frame_len =80; //Fs *frame_durn; // Length of frame  
    // in seconds
Rect_window=window('re',frame_len);
frame_shift = Fs* frame_durn/2; // 50% overlapping
    // for Rectangular window
num_of_frames= floor(length(y)/frame_shift);
    // Computing total number of frames
frame_start =1;
frame_end = frame_start + frame_len -1;
for j=1:num_of_frames
    En(j)=0;
    if frame_end > length(y) then    // Adjustement for   
        // the last segment
       frame_end = length(y)
       frame_len= frame_end-frame_start;
    end  
    segment=y(frame_start:frame_end);
    for k=1:frame_len
        En(j)=En(j)+(segment(k)*Rect_window(k))^2
        // Computing the Short Time Energy ( STE)
    end
    frame_start = frame_start + frame_shift;
    frame_end = frame_end + frame_shift;
end
subplot(313)
plot(En)
title('Shor Time Energy using window of 40ms')
xlabel('Segment number')
ylabel('STE')         
                     
  
