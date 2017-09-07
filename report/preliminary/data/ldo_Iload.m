%% Load 
clear all;
load('ldo_Iload_sch.mat');
load('/uio/hume/student-u18/rikeshc/Rikesh/mast/papers/report/preliminary/data/ldo_Iload_pex.mat')
% data includes 

%%
plotwidth = 1;

Iload = Iload_sch*1000;

f1 = figure(1);
p1 = plot(Iload, vreg_sch); hold on;
     
set(p1, 'linewidth', plotwidth);
grid on;
legend('Vreg', 'location', 'best');
xlabel('Iload, mA'); ylabel('Veg, V');
%xlim([0, ]); 
%ylim([1.75, 1.85]);

%% save image
set(f1,'Units','Inches');
pos = get(f1,'Position');
set(f1,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);
print(f1, 'ldo_Iload.pdf', '-dpdf');
movefile('ldo_Iload.pdf','../img/ldo_Iload.pdf');