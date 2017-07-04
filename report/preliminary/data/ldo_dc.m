%% Load 
clear all;
load('ldo_dc_sch.mat');
% data includes 

%%
plotwidth = 1;

f1 = figure(1);
p1 = plot(dc_sch, vreg_dcu_sch); hold on;
     plot(dc_sch, vreg_dcm_sch);
set(p1, 'linewidth', plotwidth);
grid on;
legend1 = sprintf('Iload: 100 uA, Vreg = %.3f, Vdrop = %3.f mV', mean(vreg_dcu_sch(495:end)), (dc_sch(495)-dc_sch(439))*1000);
legend2 = sprintf('Iload: 10 mA, Vreg = %.3f, Vdrop = %3.f mV', mean(vreg_dcm_sch(682:end)), (dc_sch(682)-dc_sch(457))*1000);
legend(legend1, legend2, 'location', 'best');
xlabel('Time, us'); ylabel('Veg, V');
xlim([1.7, 2.2]); 
ylim([0, 2]);

precision = 1e-3;
dc_sch_round = round((1/precision)*dc_sch);

%% save image
set(f1,'Units','Inches');
pos = get(f1,'Position');
set(f1,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);
print(f1, 'ldo_dc.pdf', '-dpdf');
movefile('ldo_dc.pdf','../img/ldo_dc.pdf');