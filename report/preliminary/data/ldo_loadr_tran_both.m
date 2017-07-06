%% load line reg tran data for sch
clear all;
load('ldo_loadr_tran_sch.mat');
load('ldo_loadr_tran_pex.mat');
% data includes 50u to 95u period 25u in between

%% plotting

plotwidth = 1;
time = time_sch*10^6;
timep = time_pex*10^6;
Iload_sch = Iload_lr_sch*1000;
Iload_pex = Iload_lr_pex*1000;

f1 = figure(1);
subplot(2,1,1);
p1 = plot(time, Iload_sch, 'b'); hold on;
    %plot(timep, Iload_pex, 'r--');
    hold off;
set(p1, 'linewidth', plotwidth);
grid on;
xlim([109, 116]); %
ylim([-1, 11]);
ylabel('Iload, mA');
legend('Iload');
title('Load regulation', 'FontSize', 10);

subplot(2,1,2);
p1 = plot(time, vreg_lr_sch, 'b'); hold on;
    plot(timep, vreg_lr_pex, 'r--'); 
set(p1, 'linewidth', plotwidth);
grid on;

txt1 = sprintf('%.4f V', vreg_lr_sch(200));
txt2 = sprintf('%.4f V', vreg_lr_sch(700));
txt1p = sprintf('%.4f V', vreg_lr_pex(1720));
txt2p = sprintf('%.4f V', vreg_lr_pex(1400));

%line regulation
loadr = (mean(vreg_lr_sch(1:250)) - mean(vreg_lr_sch(450:750)))/10*1000000; % uV/mA
loadrp = (mean(vreg_lr_pex(1:500)) - mean(vreg_lr_pex(800:1500)))/10*1000000; % uV/mA

plot(time(250), vreg_lr_sch(250), '*b');
plot(time(450), vreg_lr_sch(450), '*b');
plot(timep(1720), vreg_lr_pex(1720), '*r');
plot(timep(1400), vreg_lr_pex(1400), '*r');


text(109.05, 1.797, txt1, 'color', 'b');
text(111, 1.797, txt2, 'color', 'b');
text(115.05, 1.807, txt1p, 'color', 'r');
text(113.6, 1.807, txt2p, 'color', 'r');
legend('Vreg','location', 'best');

legend('Pre-layout', 'Post-layout', 'location', 'best');

xlabel('Time, us'); ylabel('Veg, V');
xlim([109, 116]); 
% ylim([0, 2]);
%% save image
set(f1,'Units','Inches');
pos = get(f1,'Position');
set(f1,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);
print(f1, 'ldo_loadr_both.pdf', '-dpdf');
movefile('ldo_loadr_both.pdf','../img/ldo_loadr_both.pdf');
