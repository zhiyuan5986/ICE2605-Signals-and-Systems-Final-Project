% part2
% (1)
[x_N,Fs] = audioread("./ta.wav");
Fs0 = Fs;
x_N0 = x_N;

x_N1 = x_N(1:2:length(x_N),:);
Fs1 = Fs/2;

x_N2 = x_N(1:4:length(x_N),:);
Fs2 = Fs/4;

x_N3 = x_N(1:8:length(x_N),:);
Fs3 = Fs/8;

x_N4 = x_N(1:16:length(x_N),:);
Fs4 = Fs/16;

x_N5 = x_N(1:32:length(x_N),:);
Fs5 = Fs/32;

x_N6 = x_N(1:64:length(x_N),:);
Fs6 = Fs/64;

audiowrite("ta0.wav",x_N0,int32(Fs0))
audiowrite("ta1.wav",x_N1,int32(Fs1))
audiowrite("ta2.wav",x_N2,int32(Fs2))
audiowrite("ta3.wav",x_N3,int32(Fs3))
audiowrite("ta4.wav",x_N4,int32(Fs4))
audiowrite("ta5.wav",x_N5,int32(Fs5))
audiowrite("ta6.wav",x_N6,int32(Fs6))

% (2)


n_t0 = 0:1/100:length(x_N0)-1/100;
x_t0 = interp1((1:length(x_N0))/Fs0,x_N0,n_t0/Fs0,'linear',0);
PlotWave(n_t0/Fs0,x_t0,"x_0(t)",1)

X = fft(x_N);
PlotSpectrumLocal(10000,Fs,length(x_N),X,"X(jw)",8)
X_0 = fft(x_t0);
PlotSpectrumLocal(10000,Fs0*100,length(x_t0),X_0,"X_0(jw)",9)

n_t1 = 0:1/200:length(x_N1)-1/200;
x_t1 = interp1((1:length(x_N1))/Fs1,x_N1,n_t1/Fs1,'linear',0);
PlotWave(n_t1/Fs1,x_t1,"x_1(t)",2)
X_1 = fft(x_t1);
PlotSpectrumLocal(10000,Fs1*100,length(x_t1),X_1,"X_1(jw)",10)

n_t2 = 0:1/400:length(x_N2)-1/400;
x_t2 = interp1((1:length(x_N2))/Fs2,x_N2,n_t2/Fs2,'linear',0);
PlotWave(n_t2/Fs2,x_t2,"x_2(t)",3)

n_t3 = 0:1/800:length(x_N3)-1/800;
x_t3 = interp1((1:length(x_N3))/Fs3,x_N3,n_t3/Fs3,'linear',0);
PlotWave(n_t3/Fs3,x_t3,"x_3(t)",4)

n_t4 = 0:1/1600:length(x_N4)-1/1600;
x_t4 = interp1((1:length(x_N4))/Fs4,x_N4,n_t4/Fs4,'linear',0);
PlotWave(n_t4/Fs4,x_t4,"x_4(t)",5)

n_t5 = 0:1/3200:length(x_N5)-1/3200;
x_t5 = interp1((1:length(x_N5))/Fs5,x_N5,n_t5/Fs5,'linear',0);
PlotWave(n_t5/Fs5,x_t5,"x_5(t)",6)

n_t6 = 0:1/6400:length(x_N6)-1/6400;
x_t6 = interp1((1:length(x_N6))/Fs6,x_N6,n_t6/Fs6,'linear',0);
PlotWave(n_t6/Fs6,x_t6,"x_6(t)",7)

energy0 = sum(x_t0.*x_t0);
energy1 = sum(x_t1.*x_t1);
energy2 = sum(x_t2.*x_t2);
energy3 = sum(x_t3.*x_t3);
energy4 = sum(x_t4.*x_t4);
energy5 = sum(x_t5.*x_t5);
energy6 = sum(x_t6.*x_t6);

fprintf("The ratio between x_1(t) and x_0(t) is %.2f in tunnel 1 and %.2f in tunnel 2\n",energy1./energy0)
fprintf("The ratio between x_2(t) and x_0(t) is %.2f in tunnel 1 and %.2f in tunnel 2\n",energy2./energy0)
fprintf("The ratio between x_3(t) and x_0(t) is %.2f in tunnel 1 and %.2f in tunnel 2\n",energy3./energy0)
fprintf("The ratio between x_4(t) and x_0(t) is %.2f in tunnel 1 and %.2f in tunnel 2\n",energy4./energy0)
fprintf("The ratio between x_5(t) and x_0(t) is %.2f in tunnel 1 and %.2f in tunnel 2\n",energy5./energy0)
fprintf("The ratio between x_6(t) and x_0(t) is %.2f in tunnel 1 and %.2f in tunnel 2\n",energy6./energy0)