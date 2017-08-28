% Rectifier Vs and Is for schematic to see conduciton 

%% Load variables
clear all;
load('rectifier_I_sch.mat');
load('rectifier_V_sch.mat');

%% plot data

from = 327;
to = 981;
plotwidth = 1;
time2 = ((time-time(from))*10^9);

f1 = figure(1); 
subplot(3, 1, 1);
p1 = plot(time2(from: to), Vac(from: to), time2(from: to), Vin1(from: to),time2(from: to), Vin2(from: to), time2(from: to), Vrec(from: to));
set(p1, 'linewidth', plotwidth);
grid on;
legend('Vac', 'Vin1', 'Vin2', 'Vrec', 'location', 'best');
%xlabel('time (ns)'); 
ylabel('Voltage (V)');
%xlim([1.5, 2.8]); 
ylim([-2.6, 2.6]);

subplot(3, 1, 2);
p2 = plot(time2(from: to), I0(from: to)*10^3,time2(from: to), I2(from: to)*10^3);
set(p2, 'linewidth', plotwidth);
grid on;
legend('I1', 'I2', 'location', 'best');
%xlabel('time (ns)'); 
ylabel('Current (mA)');
%xlim([1.5, 2.8]); 
ylim([-5, 70]);

subplot(3, 1, 3);
p2 = plot(time2(from: to), I1(from: to)*10^3, time2(from: to), I3(from: to)*10^3);
set(p2, 'linewidth', plotwidth);
grid on;
legend('I3', 'I4','location', 'best' );
xlabel('time (ns)'); 
ylabel('Current (mA)');
%xlim([1.5, 2.8]); 
ylim([-5, 70]);
% VREC GND

%% one diode in each half
f1 = figure;
%f3 = figure('Position', [100, 100, 1024, 1200]); 
s1 = subplot(2, 1, 1);
plot(time2(from: to), Vac(from: to), time2(from: to), Vin1(from: to),time2(from: to), Vin2(from: to), time2(from: to), Vrec(from: to));
% p1 = get(s1, 'position');
% p1(4) = p1(4)*1.20;
% set(s1, 'position', p1);
grid on;
legend('Vac', 'Vin1', 'Vin2', 'Vrec', 'location', 'best');
%xlabel('time (ns)'); 
ylabel('Voltage (V)');
%xlim([1.5, 2.8]); 
ylim([-2.6, 2.6]);
title('Input voltages', 'FontSize', 10);

s2 = subplot(2, 1, 2);
plot(time2(from: to), I0(from: to)*10^3,time2(from: to), I1(from: to)*10^3);
grid on;
legend('I1, I2(-ve half) ', 'I3, I4(+ve half)', 'location', 'best');
%xlabel('time (ns)'); 
ylabel('Current (mA)');
xlabel('time (ns)');
%xlim([1.5, 2.8]); 
ylim([-5, 70]);
title('Diode currents', 'FontSize', 10);

% p2 = get(s2, 'position');
% p2(4) = p2(4)*1.20;
% set(s2, 'position', p2);


%% saving plot to a location
set(f1,'Units','Inches');
pos = get(f1,'Position');
set(f1,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);
print(f1, 'rectifier_VI.pdf', '-dpdf');
movefile('rectifier_VI.pdf','../img/rectifier_VI.pdf');
