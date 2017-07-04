%% Load 
clear all;
load('ldo_tran_sch.mat');
% data includes 

%%
plotwidth = 1;
time = t_sch * 10^6;
f1 = figure(1);
p1 = plot(time, vreg_100u_sch); hold on;
     plot(time, vreg_10m_sch);
set(p1, 'linewidth', plotwidth);
grid on;
legend1 = sprintf('Iload: 100 uA, Vreg = %.3f', mean(vreg_100u_sch(200:245)));
legend2 = sprintf('Iload: 10 mA, Vreg = %.3f', mean(vreg_10m_sch(200:245)));
legend(legend1, legend2, 'location', 'best');
xlabel('Time, us'); ylabel('Veg, V');
xlim([0, 50]); 
ylim([0, 2]);

%% save image
set(f1,'Units','Inches');
pos = get(f1,'Position');
set(f1,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);
print(f1, 'ldo_transient.pdf', '-dpdf');
movefile('ldo_transient.pdf','../img/ldo_transient.pdf');