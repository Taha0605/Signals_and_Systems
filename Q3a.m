%2020B5AA0910P
%Sampling rate
Fs = 500*1000;
maxtime = 20*0.001;
n = Fs*maxtime;

t = linspace(0*0.001, 20*0.001, n);
L = length(t);

%signal frequency;
fc = 1910;
A = 7;
x1 = A*cos(2*pi*fc*t(1:L/2));
x1 = cat(2, x1, zeros(1,L/2));

b = 9*0.001;
subplot(3,1,1)

plot(1000*t, x1), xlabel('Time(ms)'), ylabel('Amplitude'), title('x(t)');

delay = 4500; %b*Fs
x1_shifted = cat(2, x1(delay:L/2), zeros(1, L/2+delay-1));

subplot(3,1,2)
plot(1000*t, x1_shifted), xlabel('Time(ms)'), ylabel('Amplitude'), title('x(t+9ms)');

%t5 = t-b;
%subplot(3,1,2)
%plot(t5,x1t,'linewidth',2);
%legend('x(t+b)')
%title('Plot of x1(t+b) vs t')
%xlabel('time(s)')
%ylabel('Amplitude')
%xlim([-0.015 0.015]);
%ylim([-6 6]);

x2 = A*cos(2*pi*fc*1.5*t(1:L/2));

%shifting%
% t1 = t(1:L/2)-b;
% x2 = A*cos(2*pi*fc*(t(1:L/2)-b));
% x2 = cat(2, x2, zeros(length(t1)-length(x2)))
% plot(1000*t1, x2), xlabel('Time(ms)'), ylabel('Amplitude'), title('x(t+9ms)');
% xlim([0 20])

%part b%
t2 = linspace(-20*0.001, 0, n);
t2 = (t2+b)*2/3;

%Bringing to proper limits;

x2 = A*cos(2*pi*fc*3/2*(t2));
t2 = t2(t2>0);
t2 = cat(2, t2, linspace(0.006, 0.020, L-length(t2)));
x2 = x2(5501:length(t2));
x2 = cat(2,x2,zeros(1,L-length(x2)));

subplot(3,1,3)
plot(1000*t2, x2), xlabel('Time(ms)'), ylabel('Amplitude'), title('x(9ms-3/2t)')

