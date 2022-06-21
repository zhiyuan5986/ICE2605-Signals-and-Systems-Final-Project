% Part 1
% (1)
[x_N, Fs] = audioread('./spring.wav');

% Figure out sample period T
T=1/Fs;
w_s=2*pi*Fs;
N = length(x_N);
fprintf("The sampling rate is: %d Hz and the sampling period T is: %f s\n",Fs,T)
sound(x_N,Fs)

% Plot the waveform of x(t)
n = 1:1:N;
n_t = 0:0.01:N-0.01; %linspace(0,N,4*N);
t = n_t*T;                              % t is the base of plot  
N_t = 100*N;                              % The number of elements of "continuous" time signal 
x_t = interp1(n,x_N,n_t,'linear',0);
w_s_t = 100*w_s;                          % w_s of "continuous" time signal 
Fs_t = 100*Fs;                            % Fs of "continuous" time signal 
PlotWave(t,x_t,"x(t)",1)

% (2)
% Use x_t1, x_t2, x_t3 to denote x(-t), x(2t) and x(t/2) respectively.
x_t1 = flipud(x_t);                     % Get x(-t)
PlotWave(t,x_t1,"x(-t)",2)

t2 = linspace(0,N*T/2,length(t));       % Change time axis base for x(2t)
x_t2 = x_t;
PlotWave(t2,x_t2,"x(2t)",3)

t3 = linspace(0,N*T*2,length(t));       % Change time axis base for x(t/2)
x_t3 = x_t;
PlotWave(t3,x_t3,"x(t/2)",4)

% (3)
% Use X, X1, X2, X3 to denote the spectra of x(t), x(−t), x(2t) and x(t/2)
X = fft(x_t);                                   % Get the spectrum of x(t)
Fs_base = linspace(-N_t/2,N_t/2,N_t)*Fs_t/N_t;  % Get the frequency base to plot 
PlotSpectrum(Fs_base,X,"X(j \omega )",5)
PlotSpectrumLocal(5000,Fs_t,N_t,X,"X(j \omega )",6)

X1 = fft(flipud(x_t));
PlotSpectrum(Fs_base,X1,"X_1(j \omega )",7)
PlotSpectrumLocal(5000,Fs_t,N_t,X1,"X_1(j \omega )",8)

X2 = X/2;
PlotSpectrum(2*Fs_base,X2,"X_2(j \omega )",9)
PlotSpectrumLocal(5000,2*Fs_t,N_t,X2,"X_2(j \omega )",10)

X3 = X*2;
PlotSpectrum(Fs_base/2,X3,"X_3(j \omega )",11)
PlotSpectrumLocal(5000,Fs_t/2,N_t,X3,"X_3(j \omega )",12)

% (4)
% Use x_r_abs and x_r_angle to denote the IFT of |X(j\omega)| 
% and e^{j argX(j\omega) }

x_r_abs = ifft(abs(X));                 % Get the IFT of |X(j\omega)|
PlotWave(t,x_r_abs,"\mathcal{F}^{-1}{|X(j\omega)|}",13)

x_r_angle = real(ifft(exp(i*angle(X)))); % Get the IFT of e^{j argX(j\omega) }
PlotWave(t,x_r_angle,"\mathcal{F}^{-1}{e^{jX(j\omega)}}",14) 

sound(real(ifft(abs(X).*exp(i*angle(X)))),4*Fs) % You can hear that it's almost the same as the initial one.

% (5) 
% ILPF is a ideal lowpass filter, you can set the second parameter as the
% cut-off frequency.
[x_lp,X_lp] = ILPF(x_t,1000,w_s_t,N_t);
PlotWave(t,real(x_lp),"x_{lp}(t)",15)
PlotSpectrum(Fs_base,X_lp,"X_{lp}(j \omega )",16)

PlotSpectrumLocal(5000,Fs_t,N_t,X_lp,"X_{lp}(j \omega )",17)






