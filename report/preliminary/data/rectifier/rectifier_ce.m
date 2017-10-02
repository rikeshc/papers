% vce, pce, ppce for rectifier schematic
% 1.5V to 1.8 with steps of 50mV


%% load saved variables
clear all;
load('ce_sch.mat');
load('rectifier_vce_pex.mat');
load('rectifier_pce_pex.mat');

%% plot
f1 = figure(1);
p = plot(Vac, vce, '-*b', Vac, ppce, '-*r', Vac_pex, vce_pex, '--ob', Vac_pex2, ppce_pex, '--or');
set(p, 'linewidth', 1);
grid on;
legend('VCE, pre-layout', 'PCE, pre-layout', 'VCE, post-layout', 'PCE, post-layout', 'location', 'best');
xlabel('Vac Magnitude, Vp'); ylabel('Conversion efficiency, %');
xlim([1.6, 2.8]); ylim([45, 95]);
title('Conversion efficiency', 'FontSize', 10);

%% saving plot
%% saving plot to a location
set(f1,'Units','Inches');
pos = get(f1,'Position');
set(f1,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);
print(f1, 'rectifier_ce.pdf', '-dpdf');
movefile('rectifier_ce.pdf','../img/rectifier_ce.pdf');

