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
%legend1 = sprintf('Iload: 10 uA, Vreg = %.3f, Vdrop = %3.f mV', mean(vreg_dcu_sch(495:end)), (dc_sch(495)-dc_sch(439))*1000);
%legend2 = sprintf('Iload: 10 mA, Vreg = %.3f, Vdrop = %3.f mV', mean(vreg_dcm_sch(682:end)), (dc_sch(682)-dc_sch(457))*1000);
legend('Iload: 10 uA','Iload: 10 mA', 'location', 'best');
xlabel('Vrec/Vin, V'); ylabel('Veg, V');
xlim([1.7, 2.5]); 
ylim([0, 2]);
index1 = find(round(vreg_dcu_sch, 3) == 1.795, 1);
index2 = find(round(vreg_dcm_sch, 3) == 1.795, 1);
txt1 = sprintf('Vrec Min = %.2f V', dc_sch(index1));
txt2 = sprintf('Vrec Min = %.2f V', dc_sch(index2));

plot(dc_sch(index1), vreg_dcu_sch(index1), '*');
plot(dc_sch(index2), vreg_dcm_sch(index2), '*');
legend('Iload: 10 uA','Iload: 10 mA', txt1, txt2', 'location', 'best');


%% save image
set(f1,'Units','Inches');
pos = get(f1,'Position');
set(f1,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);
print(f1, 'ldo_dc.pdf', '-dpdf');
movefile('ldo_dc.pdf','../img/ldo_dc.pdf');