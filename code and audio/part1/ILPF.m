function [x_lp,X_lp] = ILPF(x_t,f,w_s_t,N_t)
% This function is used as a ideal low pass filter.
% Format of calls:
% ILPF(signal,cut_off_frequency,sampling_frequency,length_of_signal)
X = fft(x_t);
X(floor(f*2*pi*N_t/(w_s_t)):length(X)-floor(f*2*pi*N_t/(w_s_t)),:)=0;
X_lp = X;
x_lp = ifft(X_lp);
end
