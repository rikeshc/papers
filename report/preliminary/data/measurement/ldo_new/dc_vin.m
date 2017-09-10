clear all;
load('ldo_Vrec_sweep.mat');
load('/uio/hume/student-u18/rikeshc/Rikesh/mast/papers/report/preliminary/data/ldo_dc_pex.mat')

f1 = figure(1);
plot(Vrec, Vreg, '*-.'); hold on;
plot(dc_pex, vreg_dcm_pex); hold off;

xlabel('V_{in}, V');
ylabel('V_{reg}, V');
grid on;
ylim([0, 1.9]);
%leg1 = sprintf('V_{reg} = %.3f V,  Del V = %.3f, F = %2.2f MHz',Vreg_avg, Vreg_vpp, F_Vreg);
legend('Measured', 'Simulated',  'location', 'best');
title('Measured:LDO Vin sweep', 'FontSize', 10);

%% save plot
set(f1,'Units','Inches');
pos = get(f1,'Position');
set(f1,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);
print(f1, 'ldo_vin_sweep.pdf', '-dpdf');
movefile('ldo_vin_sweep.pdf','../../../img/meas/ldo_vin_sweep.pdf');