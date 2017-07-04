%%
s1b = importdata('/uio/hume/student-u18/rikeshc/ads/MyWorkspace_wrk/data_wpts/s11.txt');
s2b = importdata('/uio/hume/student-u18/rikeshc/ads/MyWorkspace_wrk/data_wpts/s22.txt');
s1a = importdata('/uio/hume/student-u18/rikeshc/ads/MyWorkspace_wrk/data_wpts/s11a.txt');
s2a = importdata('/uio/hume/student-u18/rikeshc/ads/MyWorkspace_wrk/data_wpts/s22a.txt');
%%
%%
freq = s1b.data(:, 1);
S11b = s1b.data(:, 2);
S22b = s2b.data(:, 2);
S11a = s1a.data(:, 2);
S22a = s2a.data(:, 2);
%% 
figure(1)
subplot(2, 1, 1);
plot(freq/10^6, S11b, freq/10^6, S22b)
grid on;
legend('S11', 'S22');
xlabel('Frequency, MHz');
ylabel('Magnitude, dB');
title('Before matching');

subplot(2, 1, 2);
plot(freq/10^6, S11a, freq/10^6, S22a)
grid on;
legend('S11', 'S22');
xlabel('Frequency, MHz');
ylabel('Magnitude, dB');
title('After matching');