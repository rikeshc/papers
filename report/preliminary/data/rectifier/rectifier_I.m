% I0 I1 I2 and I3 plot for rectifier diode currents
% data includes 150u to 200u trans

%% Read data from file
clear all;
I_sch = importdata('rectifier_sch_I.matlab');
time = I_sch.data(:, 1);
I0 = I_sch.data(:, 2);
I1 = I_sch.data(:, 4);
I2 = I_sch.data(:, 6);
I3 = I_sch.data(:, 8);

clear I_sch;    %saving only required variables
save('I_sch');

%% Load 
clear all;
load('rectifier_I_sch.mat');

%% plot data

from = 327;
to = 981;
plotwidth = 1;
time2 = ((time-time(from))*10^9);

f1 = figure(1); % all current wave
p1 = plot(time2(from: to), I0(from: to)*10^3, time2(from: to), I1(from: to)*10^3,time2(from: to), I2(from: to)*10^3, time2(from: to), I3(from: to)*10^3);
set(p1, 'linewidth', plotwidth);
grid on;
legend('I0', 'I1', 'I2', 'I3');
xlabel('time (ns)'); ylabel('Current (mA)');
%xlim([1.5, 2.8]); 
ylim([-5, 70]);

%% save plot
set(f1,'Units','Inches');
pos = get(f1,'Position');
set(f1,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);
print(f1, 'rectifier_I.pdf', '-dpdf');
movefile('rectifier_I.pdf','../img/rectifier_I.pdf');
