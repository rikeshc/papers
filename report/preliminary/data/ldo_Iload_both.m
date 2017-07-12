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
p1 = plot(Iload, vreg_sch, 'b'); hold on;
    plot(Iloadp, vreg_pex, 'r--');
     
set(p1, 'linewidth', plotwidth);
grid on;
legend1 = sprintf('Schematic, Avg = %.4f V', mean(vreg_sch(1:2400)));
legend2 = sprintf('Post-layout, Avg = %.4f V', mean(vreg_pex(1:2400)));
xlabel('Iload, mA'); ylabel('Veg, V');
xlim([0, 12]);

index1 = find(0.1 == round(Iload, 3), 1);
index2 = find(10 == round(Iload, 3), 1);

plot(Iload(index1), vreg_sch(index1), 'b*',Iload(index2), vreg_sch(index2), 'b*')
plot(Iload(index1), vreg_pex(index1), 'r*',Iload(index2), vreg_pex(index2), 'r*')

txt1 = sprintf('%.4f V', vreg_sch(index1)); 
txt2 = sprintf('%.4f V', vreg_sch(index2));
txt1p = sprintf('%.4f V', vreg_pex(index1)); 
txt2p = sprintf('%.4f V', vreg_pex(index2));

text(0.1, 1.8001, txt1, 'color', 'b');
text(9.3, 1.80, txt2, 'color', 'b');
text(0.1, 1.8037, txt1p, 'color', 'r');
text(9.3, 1.8036, txt2p, 'color', 'r');

%ylim([1.75, 1.85]);
title('Load/output characteristics', 'FontSize', 10);
legend(legend1, legend2, 'location', 'best');

%% save image
set(f1,'Units','Inches');
pos = get(f1,'Position');
set(f1,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);
print(f1, 'ldo_Iload_both.pdf', '-dpdf');
movefile('ldo_Iload_both.pdf','../img/ldo_Iload_both.pdf');