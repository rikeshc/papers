% vce, pce, ppce for rectifier schematic
% 1.5V to 1.8 with steps of 50mV

%% Read from file
clear all;
ce_sch = importdata('rectifier_sch_ce.matlab');
Vac = ce_sch.data(:, 1);
vce = ce_sch.data(:, 2);
pce = ce_sch.data(:, 4);
ppce = ce_sch.data(:, 6);

clear ce_sch;    %saving only required variables
save('ce_sch');

%% load saved variables
clear all;
load('ce_sch.mat');

%% plot
f1 = figure(1);
p = plot(Vac, vce, '-*', Vac, ppce, '-o');
set(p, 'linewidth', 1);
grid on;
legend('VCE', 'PCE');
xlabel('Vac'); ylabel('Conversion efficiency');
xlim([1.5, 2.8]); ylim([40, 100]);

%% saving plot
%% saving plot to a location
set(f1,'Units','Inches');
pos = get(f1,'Position');
set(f1,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);
print(f1, 'rectifier_ce.pdf', '-dpdf');
movefile('rectifier_ce.pdf','../img/rectifier_ce.pdf');

