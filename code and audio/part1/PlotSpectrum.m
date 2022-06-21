function PlotSpectrum(x,y,string,num)
% This function is used to plot the spectrum of each "continue time signal"
% Format of calls: PlotWave(base,spectrum,spectrum_name,figure_num)

figure(num)
y = fftshift(y);
title(string)
subplot(2,2,1)
plot(x,abs(y(:,1)),'-')
title(sprintf("Magnitude of $%s$ (Tunnel 1)",string),'Interpreter',"latex")
xlabel("frequency/Hz")
subplot(2,2,2)
plot(x,abs(y(:,2)),'r-')
title(sprintf("Magnitude of $%s$ (Tunnel 2)",string),'Interpreter',"latex")
xlabel("frequency/Hz")

subplot(2,2,3)
plot(x,angle(y(:,1)),'-')
title(sprintf("Phase of $%s$ (Tunnel 1)",string),'Interpreter',"latex")
xlabel("frequency/Hz")
subplot(2,2,4)
plot(x,angle(y(:,2)),'r-')
title(sprintf("Phase of $%s$ (Tunnel 2)",string),'Interpreter',"latex")
xlabel("frequency/Hz")
end