%% Load 
clear all;
load('ldo_dc_sch.mat');
load('ldo_dc_pex.mat');
% data includes 

%%
plotwidth = 1;

f1 = figure(1);
p1 = plot(dc_sch, vreg_dcm_sch, 'b'); hold on;
     %plot(dc_sch, vreg_dcm_sch);
     %plot(dc_pex, vreg_dcu_pex);
     plot(dc_pex, vreg_dcm_pex, 'r--');
set(p1, 'linewidth', plotwidth);
grid on;
%legend('Pre-layout','Post-layout', 'location', 'best');
xlabel('Vrec/Vin, V'); ylabel('Veg, V');
xlim([1.7, 2.5]); 
ylim([0, 2]);
% index1 = find(round(vreg_dcu_sch, 3) == 1.796, 1);
index2 = find(round(vreg_dcm_sch, 3) == 1.795, 1);
% txt1 = sprintf('Vrec Min = %.2f V', dc_sch(index1));
txt2 = sprintf('Vrec Min = %.2f V', dc_sch(index2));

% index1p = find(round(vreg_dcu_pex, 3) == 1.796, 1);
index2p = find(round(vreg_dcm_pex, 3) == 1.795, 1);
% txt1p = sprintf('Vrec Min = %.2f V', dc_pex(index1p));
txt2p = sprintf('Vrec Min = %.2f V', dc_pex(index2p));

str1 = sprintf('Pre-layout, Vin min = %.2f V, Vreg = %.3f V', dc_sch(index2), mean(vreg_dcm_sch(600:end)));
str2 = sprintf('Post-layout, Vin min = %.2f, Vreg = %.3f V', dc_pex(index2p), mean(vreg_dcm_pex(600:end)));

%plot(dc_sch(index1), vreg_dcu_sch(index1), '*');
%plot(dc_sch(index2), vreg_dcm_sch(index2), '*');
legend(str1, str2', 'location', 'best');
title('Input/output characteristics', 'FontSize', 10);



%% save image
set(f1,'Units','Inches');
pos = get(f1,'Position');
set(f1,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);
print(f1, 'ldo_dc_both.pdf', '-dpdf');
movefile('ldo_dc_both.pdf','../img/ldo_dc_both.pdf');