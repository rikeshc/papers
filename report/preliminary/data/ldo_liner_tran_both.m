%% load line reg tran data for sch
clear all;
load('ldo_liner_tran_sch.mat');
load('ldo_liner_tran_pex.mat');
% data includes 226 to 238

%% plotting

plotwidth = 1;
time = (time_sch*10^6);
timep = (time_pex*10^6);

f1 = figure(1);
subplot(2,1,1);
p1 = plot(time, vrec_lr_sch, 'b'); hold on;
     %plot(timep, vrec_lr_pex, 'r--');
     hold off;
set(p1, 'linewidth', plotwidth);
grid on;
xlim([229, 236]); 
ylim([1.9, 2.6]);
ylabel('Vec, V');
legend('Vrec/Vin', 'location', 'best');
title('Line regulation', 'FontSize', 10);

subplot(2,1,2);
p1 = plot(time, vreg_lr_sch, 'b'); hold on;
     plot(timep, vreg_lr_pex, 'r--')
set(p1, 'linewidth', plotwidth);
grid on;

txt1 = sprintf('%.4f V', mean(vreg_lr_sch(1:600)));
txt2 = sprintf('%.4f V', mean(vreg_lr_sch(1000:1600)));
txt1p = sprintf('%.4f V', mean(vreg_lr_pex(1:600)));
txt2p = sprintf('%.4f V', mean(vreg_lr_pex(1000:1600)));

%line regulation
liner = (mean(vreg_lr_sch(1:600)) - mean(vreg_lr_sch(1000:1600)))/.5*1000000; % uV/V
linerp = (mean(vreg_lr_pex(1:600)) - mean(vreg_lr_pex(1000:1600)))/.5*1000000;  % uV/V

plot(time(700), vreg_lr_sch(700), '*b');
plot(time(1015), vreg_lr_sch(1015), '*b');
plot(timep(1615), vreg_lr_pex(1615), '*r');
plot(timep(1950), vreg_lr_pex(1950), '*r');

text(229.1, 1.798, txt1, 'color', 'b');
text(230.5, 1.798, txt2, 'color', 'b');
text(235, 1.804, txt1p, 'color', 'r');
 text(233.5, 1.804, txt2p, 'color', 'r');
legend('Pre-layout', 'Post-layout','location', 'best');

%legend('Vreg', 'location', 'best');
xlabel('Time, us'); ylabel('Veg, V');
xlim([229, 236]); 
%ylim([0, 2]);


%% save image
set(f1,'Units','Inches');
pos = get(f1,'Position');
set(f1,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);
print(f1, 'ldo_liner_both.pdf', '-dpdf');
movefile('ldo_liner_both.pdf','../img/ldo_liner_both.pdf');
