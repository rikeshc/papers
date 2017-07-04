%% load line reg tran data for sch
clear all;
load('ldo_loadr_tran_sch.mat');
% data includes 50u to 95u period 25u in between

%% plotting

plotwidth = 1;
time = time_sch*10^6;
Iload_sch = Iload_lr_sch*1000;

f1 = figure(1);
subplot(2,1,1);
p1 = plot(time, Iload_sch);
set(p1, 'linewidth', plotwidth);
grid on;
xlim([67, 83]); %
ylim([-1, 11]);
ylabel('Iload, mA');

subplot(2,1,2);
p1 = plot(time, vreg_lr_sch);
set(p1, 'linewidth', plotwidth);
grid on;

% legend1 = sprintf('Iload: 100 uA, Vreg = %.3f, Vdrop = %3.f mV', mean(vreg_dcu_sch(495:end)), (dc_sch(495)-dc_sch(439))*1000);
% legend2 = sprintf('Iload: 10 mA, Vreg = %.3f, Vdrop = %3.f mV', mean(vreg_dcm_sch(682:end)), (dc_sch(682)-dc_sch(457))*1000);
 %legend(legend1, legend2, 'location', 'best');
xlabel('Time, us'); ylabel('Veg, V');
xlim([67, 83]); 
% ylim([0, 2]);
%% save image
set(f1,'Units','Inches');
pos = get(f1,'Position');
set(f1,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);
print(f1, 'ldo_loadr.pdf', '-dpdf');
movefile('ldo_loadr.pdf','../img/ldo_loadr.pdf');
