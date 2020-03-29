//Example 4 . 1 . 2 Cont inuous Time Fo u r i e r Trans form
 // and Energy Dens i t y Func t ion o f a Squar e Waveform
 // x ( t )= A, f rom 􀀀T/2 to T/2
 clear all;
 clc ;
 close ;
 // Analog S i g n a l
 A =1; // Ampl i tude
 Dt = 0.005;
 T = 4; //Time i n s e c o n d s
 t = -T/2: Dt:T /2;
 for i = 1: length (t)
 xa(i) = A;
end

 //
 // Cont inuous􀀀t ime Fo u r i e r Trans form
 Wmax = 2* %pi *2; // Analog Fr equency = 2Hz

 K = 4; k = 0:( K /800) :K;
 W = k* Wmax /K;
 disp ( size (xa))
 Xa=xa '* exp (- sqrt ( -1)*t '*W)*Dt;
 Xa = real (Xa);
 W = [- mtlb_fliplr(W), W (2:501) ]; // Omega f rom 􀀀Wmax
//to Wmax

 Xa = [ mtlb_fliplr(Xa), Xa (2:501) ];
 ESD = Xa ^2; // Energy Dens i t y Spect rum
 subplot (3 ,1 ,1);
 plot (t,xa);
 xlabel ( ' t i n msec . ' );
 ylabel ( ' xa ( t ) ' )
 title ( ' Analog S i g n a l ' )
 subplot (3 ,1 ,2);
 plot (W /(2* %pi ),Xa);
 xlabel ( ' Fr equency i n Hz ' );
 ylabel ( 'Xa(jW) ' )
 title ( ' Cont inuous􀀀t ime Fo u r i e r Trans form ' )
 subplot (3 ,1 ,3);
 plot (W /(2* %pi ),ESD);
 xlabel ( ' Fr equency i n Hz ' );
 ylabel ( 'SXX ' )
 title ( ' Energy Dens i t y Spect rum ' )
