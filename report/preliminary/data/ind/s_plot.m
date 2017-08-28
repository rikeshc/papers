%%
clear all;
s1b = importdata('/uio/hume/student-u18/rikeshc/ads/MyWorkspace_wrk/data_wpts/s11b.txt');
s2b = importdata('/uio/hume/student-u18/rikeshc/ads/MyWorkspace_wrk/data_wpts/s22b.txt');
s1a = importdata('/uio/hume/student-u18/rikeshc/ads/MyWorkspace_wrk/data_wpts/s11a.txt');
s2a = importdata('/uio/hume/student-u18/rikeshc/ads/MyWorkspace_wrk/data_wpts/s22a.txt');
s21b = importdata('/uio/hume/student-u18/rikeshc/ads/MyWorkspace_wrk/data_wpts/s21b.txt');
s21a = importdata('/uio/hume/student-u18/rikeshc/ads/MyWorkspace_wrk/data_wpts/s21a.txt');

%%
freq = s1b.data(:, 1);
S11b = s1b.data(:, 2);
S22b = s2b.data(:, 2);
S21b = s21b.data(:, 2);
S11a = s1a.data(:, 2);
S22a = s2a.data(:, 2);
S21a = s21a.data(:, 2);

%% 
f1 = figure(1);
subplot(2, 1, 1);
plot(freq/10^6, S11b, freq/10^6, S22b)
grid on;
legend('S11', 'S22');
%xlabel('Frequency, MHz');
ylabel('Magnitude, dB');
xlim([10, 17]);
title('Before tunning', 'FontSize', 10);


subplot(2, 1, 2);
plot(freq/10^6, S11a, freq/10^6, S22a)
grid on;
legend('S11', 'S22');
xlabel('Frequency, MHz');
ylabel('Magnitude, dB');
xlim([10, 17]);
ylim([-65, 0]);
title('After tunning' , 'FontSize', 10);
%txt2 = sprintf('Vrec Min = %.2f V', dc_sch(index2));

%%
f2 = figure(2);
plot(freq/10^6, S21b, freq/10^6, S21a);
grid on;
legend('Before tunning', 'After tunning');
xlabel('Frequency, MHz');
ylabel('Magnitude, dB');
title('Indutive link S21', 'FontSize', 10);
ylim([-17, 0]);
xlim([10, 17]);

%%
set(f1,'Units','Inches');
pos = get(f1,'Position');
set(f1,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);
print(f1, 'ant_s1_s2_both.pdf', '-dpdf');
movefile('ant_s1_s2_both.pdf','../img/ant_s1_s2_both.pdf');

set(f2,'Units','Inches');
pos = get(f2,'Position');
set(f2,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);
print(f2, 'ant_s21_both.pdf', '-dpdf');
movefile('ant_s21_both.pdf','../img/ant_s21_both.pdf');