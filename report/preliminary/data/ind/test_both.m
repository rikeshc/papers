%%
s11 = importdata('tunned_s11.txt');
s22 = importdata('tunned_s22.txt');
s21 = importdata('tunned_s21.txt');

%%
%%
freq = s11.data(:, 1);
S11 = s11.data(:, 2);
S22 = s22.data(:, 2);
S21 = s21.data(:, 2);
% S22b = s2b.data(:, 2);
% S11a = s1a.data(:, 2);
% S22a = s2a.data(:, 2);
%% 
figure(1)
subplot(2, 1, 1);
plot(freq/10^6, S11, freq/10^6, S22)
grid on;
legend('S11', 'S22');
%xlabel('Frequency, MHz');
ylabel('Magnitude, dB');
title('Before matching', 'FontSize', 10);

subplot(2, 1, 2);
plot(freq/10^6, S11a, freq/10^6, S22a)
grid on;
legend('S11', 'S22');
xlabel('Frequency, MHz');
ylabel('Magnitude, dB');
title('After matching', 'FontSize', 10);