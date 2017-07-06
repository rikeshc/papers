%% load line reg tran data for sch
clear all;
load('ldo_liner_tran_sch.mat');
load('ldo_liner_tran_pex.mat');
% data includes 50u to 95u period 25u in between

%% plotting

plotwidth = 1;
time = time_sch*10^6;
timep = time_pex*10^6;

f1 = figure(1);
subplot(2,1,1);
p1 = plot(time, vrec_lr_sch, 'b'); hold on;
     %plot(timep, vrec_lr_pex, 'r--');
     hold off;
set(p1, 'linewidth', plotwidth);
grid on;
xlim([109, 116]); 
ylim([1.9, 2.6]);
ylabel('Vec, V');
legend('Vrec/Vin', 'location', 'best');
title('Line regulation', 'FontSize', 10);

subplot(2,1,2);
p1 = plot(time, vreg_lr_sch, 'b'); hold on;
     plot(timep, vreg_lr_pex, 'r--')
set(p1, 'linewidth', plotwidth);
grid on;

txt1 = sprintf('%.4f V', vreg_lr_sch(200));
txt2 = sprintf('%.4f V', vreg_lr_sch(700));
txt1p = sprintf('%.4f V', vreg_lr_pex(200));
txt2p = sprintf('%.4f V', vreg_lr_pex(700));

%line regulation
liner = (mean(vreg_lr_sch(1:350)) - mean(vreg_lr_sch(650:1200)))/.5*1000000; % uV/V
linerp = (mean(vreg_lr_pex(1:350)) - mean(vreg_lr_pex(650:1200)))/.5*1000;  % mV/V

plot(time(320), vreg_lr_sch(320), '*b');
plot(time(700), vreg_lr_sch(700), '*b');
plot(timep(1100), vreg_lr_pex(1100), '*r');
plot(timep(1550), vreg_lr_pex(1550), '*r');

text(109.1, 1.796, txt1, 'color', 'b');
text(111, 1.796, txt2, 'color', 'b');
text(115, 1.806, txt1p, 'color', 'r');
text(113, 1.806, txt2p, 'color', 'r');
legend('Pre-layout', 'Post-layout','location', 'best');

%legend('Vreg', 'location', 'best');
xlabel('Time, us'); ylabel('Veg, V');
xlim([109, 116]); 
%ylim([0, 2]);


%% save image
set(f1,'Units','Inches');
pos = get(f1,'Position');
set(f1,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);
print(f1, 'ldo_liner_both.pdf', '-dpdf');
movefile('ldo_liner_both.pdf','../img/ldo_liner_both.pdf');
