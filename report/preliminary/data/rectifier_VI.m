% Rectifier Vs and Is for schematic to see conduciton 

%% Load variables
clear all;
load('I_sch.mat');
load('V_sch.mat');

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

%% saving plot to a location
set(f1,'Units','Inches');
pos = get(f1,'Position');
set(f1,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);
print(f1, 'rectifier_VI.pdf', '-dpdf');
movefile('rectifier_VI.pdf','../img/rectifier_VI.pdf');
