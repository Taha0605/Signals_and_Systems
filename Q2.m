% 2020B5AA0910P
a = 9;
b = 1;
c = 1;

H = tf([1,9,1,0], [1,-1,1,-1]);
h = pzplot(H);
grid on


% Plot the magnitude of the transfer function with a custom frequency range
figure;
omega = linspace(-2*pi, 2*pi, 1000);  % Frequency range
bode(H, omega);

title('Bode Plot of Transfer Function H(s)');
xlabel('Frequency');
ylabel('Magnitude (dB), Phase (deg)');
set(findall(gcf,'type','line'),'linewidth',2);  % Increase line width