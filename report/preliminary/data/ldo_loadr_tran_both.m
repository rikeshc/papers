%% load line reg tran data for sch
clear all;
load('ldo_loadr_tran_sch.mat');
load('ldo_loadr_tran_pex.mat');
% data includes 266 to 279u period  in between

%% plotting

plotwidth = 1;
time = (time_sch*10^6);
timep = (time_pex*10^6);
Iload_sch = Iload_lr_sch*1000;
Iload_pex = Iload_lr_pex*1000;

f1 = figure(1);
subplot(2,1,1);
p1 = plot(time, Iload_sch, 'b'); hold on;
    %plot(timep, Iload_pex, 'r--');
    hold off;
set(p1, 'linewidth', plotwidth);
grid on;
xlim([229, 236]); %
ylim([-1, 11]);
ylabel('Iload, mA');
legend('Iload');
title('Load regulation', 'FontSize', 10);

subplot(2,1,2);
p1 = plot(time, vreg_lr_sch, 'b'); hold on;
    plot(timep, vreg_lr_pex, 'r--'); 
set(p1, 'linewidth', plotwidth);
grid on;

txt1 = sprintf('%.4f V', mean(vreg_lr_sch(1:600)));
txt2 = sprintf('%.4f V', mean(vreg_lr_sch(1000:1600)));
txt1p = sprintf('%.4f V', mean(vreg_lr_pex(1:600)));
txt2p = sprintf('%.4f V', mean(vreg_lr_pex(1000:1600)));

%line regulation
loadr = (mean(vreg_lr_sch(1:600)) - mean(vreg_lr_sch(1000:1600)))/10*1000000; % uV/mA
loadrp = (mean(vreg_lr_pex(1:600)) - mean(vreg_lr_pex(1000:1600)))/10*1000000; % uV/mA

plot(time(700), vreg_lr_sch(700), '*b');
plot(time(1015), vreg_lr_sch(1015), '*b');
plot(timep(1615), vreg_lr_pex(1615), '*r');
plot(timep(1950), vreg_lr_pex(1950), '*r');


text(229.1, 1.798, txt1, 'color', 'b');
text(230.5, 1.798, txt2, 'color', 'b');
text(235, 1.805, txt1p, 'color', 'r');
text(233.5, 1.805, txt2p, 'color', 'r');
legend('Vreg','location', 'best');

legend('Pre-layout', 'Post-layout', 'location', 'best');

xlabel('Time, us'); ylabel('Veg, V');
xlim([229, 236]); 
% ylim([0, 2]);
%% save image
set(f1,'Units','Inches');
pos = get(f1,'Position');
set(f1,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);
print(f1, 'ldo_loadr_both.pdf', '-dpdf');
movefile('ldo_loadr_both.pdf','../img/ldo_loadr_both.pdf');
