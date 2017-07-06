%% Load 
clear all;
load('ldo_Iload_sch.mat');
load('ldo_Iload_pex.mat');
% data includes 

%%
plotwidth = 1;

Iload = Iload_sch*1000;
Iloadp = Iload_pex*1000;

f1 = figure(1);
p1 = plot(Iload, vreg_sch); hold on;
    plot(Iloadp, vreg_pex, '--');
     
set(p1, 'linewidth', plotwidth);
grid on;
legend1 = sprintf('Schematic, Avg = %.4f V', mean(vreg_sch(1:2400)));
legend2 = sprintf('Post-layout, Avg = %.4f V', mean(vreg_pex(1:2400)));
legend(legend1, legend2, 'location', 'best');
xlabel('Iload, mA'); ylabel('Veg, V');
xlim([0, 12]); 
%ylim([1.75, 1.85]);
title('Load/output characteristics', 'FontSize', 10);

%% save image
set(f1,'Units','Inches');
pos = get(f1,'Position');
set(f1,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);
print(f1, 'ldo_Iload_both.pdf', '-dpdf');
movefile('ldo_Iload_both.pdf','../img/ldo_Iload_both.pdf');