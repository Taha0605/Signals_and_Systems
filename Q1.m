%time
t = linspace(0, 1, 1000)

% input
M = 8
N = 17 % 7+10
sum = 0
x = 0
for i=0:M
    sum = (1/(2*i+1)).*(sin((2*i+1)*2*pi*N.*t))
    x = x + sum

    if(i == 1 || i==2 || i==8)
        plot(t, x);
    end

    hold on
    xlabel('time');
    ylabel('input signal');
    title('x(t)')
end
legend('M=1', 'M=2', 'M=8')
hold off

t1 = linspace(0, 1, 1000)
h = sin(16*pi.*(t1-0.5))./(16*pi.*(t1-0.5))


yt = conv(x, h, 'same')
%sampling rate = (1-0)/1000 = 0.001s or 1000Hz

%L = length(yt)
%Fs = mean(diff(t))
%f = (0:L-1)*Fs/L
%Yf = fft(yt, 3*N)
%Yf = 1/L*Yf

% Compute the FFT of the signal
sampling_rate = 1000;  % Hz
N = length(x);
X = fft(x);
X_shifted = fftshift(X);  % shift the zero frequency component to the center of the spectrum
frequencies = linspace(-sampling_rate/2, sampling_rate/2, N);  % frequency axis centered at zero
mask = abs(frequencies) <= 51;  % only keep frequencies up to 51 Hz
X_magnitude = 2*abs(X_shifted)/N;  % magnitude of the Fourier coefficients (scaled by 2/N for the two-sided FFT)

% Plot the magnitude spectrum
plot(frequencies(mask), X_magnitude(mask))
xlabel('Frequency (Hz)')
ylabel('Magnitude')
title("Plot of |Y(f)|")

% According to Nyquist criterion, sampling rate > 2*maximum frequency
% allowed. 1000 > 102 Hz

%stem(linspace(0, 3*N, 3*N), abs(Yf)), xlabel('Frequency (Hz)'), ylabel('Amplitude'), title("Stem Plot of |Y(f)|")





