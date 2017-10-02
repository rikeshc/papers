% Vin1 Vin2 Vac and Vrec plot for rectifier voltages schematics

%% Load 
clear all;
load('V_sch.mat'); 
% data includes 150u to 200u trans

%% plot data

from = 327;
to = 981;
plotwidth = 1;
time2 = ((time-time(from))*10^9);

f1 = figure(1); % all voltage wave
p1 = plot(time2(from: to), Vac(from: to), time2(from: to), Vin1(from: to),time2(from: to), Vin2(from: to), time2(from: to), Vrec(from: to));
set(p1, 'linewidth', plotwidth);
grid on;
legend('Vac', 'Vin1', 'Vin2', 'Vrec');
xlabel('time (ns)'); ylabel('Voltage (V)');
%xlim([1.5, 2.8]); 
%ylim([40, 100]);

f2 = figure(2); % ripple
p = plot(time2(from: to), Vrec(from: to));
set(p, 'linewidth', plotwidth);
legend('Vrec');
xlabel('time (ns)'); ylabel('Voltage (V)');
grid on;


%% saving plot to a location
set(f1,'Units','Inches');
pos = get(f1,'Position');
set(f1,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);
print(f1, 'rectifier_V.pdf', '-dpdf');
movefile('rectifier_V.pdf','../img/rectifier_V.pdf');

set(f2,'Units','Inches');
pos = get(f1,'Position');
set(f2,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);
print(f2, 'rectifier_ripple.pdf', '-dpdf');
movefile('rectifier_ripple.pdf','../img/rectifier_ripple.pdf');
