% vce, pce, ppce for rectifier schematic
% 1.5V to 1.8 with steps of 50mV


%% load saved variables
clear all;
load('ce_sch.mat');
load('vce_pex.mat');

%% plot
f1 = figure(1);
p = plot(Vac, vce, '-*', Vac, ppce, '-o', Vac_pex, vce_pex, '-*');
set(p, 'linewidth', 1);
grid on;
legend('VCE, pre-layout', 'PCE, pre-layout', 'VCE, post-layout', 'location', 'best');
xlabel('Vac Magnitude, Vp'); ylabel('Conversion efficiency, %');
xlim([1.6, 2.8]); ylim([45, 95]);

%% saving plot
%% saving plot to a location
set(f1,'Units','Inches');
pos = get(f1,'Position');
set(f1,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);
print(f1, 'rectifier_ce.pdf', '-dpdf');
movefile('rectifier_ce.pdf','../img/rectifier_ce.pdf');

