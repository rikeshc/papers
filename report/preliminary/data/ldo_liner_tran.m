%% load line reg tran data for sch
clear all;
load('ldo_liner_tran_sch.mat');
% data includes 50u to 95u period 25u in between

%% plotting

plotwidth = 1;
time = time_sch*10^6;

f1 = figure(1);
subplot(2,1,1);
p1 = plot(time, vrec_lr_sch, 'b');
set(p1, 'linewidth', plotwidth);
grid on;
xlim([108, 117]); 
ylim([1.9, 2.6]);
ylabel('Vec, V');
legend('Vrec/Vin', 'location', 'best');

subplot(2,1,2);
p1 = plot(time, vreg_lr_sch, 'b'); hold on;
set(p1, 'linewidth', plotwidth);
grid on;

txt1 = sprintf('%.4f V', vreg_lr_sch(200));
txt2 = sprintf('%.4f V', vreg_lr_sch(700));

%line regulation
liner = (mean(vreg_lr_sch(1:250)) - mean(vreg_lr_sch(450:750)))/.5*1000000;

plot(time(200), vreg_lr_sch(200), '*b');
plot(time(600), vreg_lr_sch(600), '*b');
text(108.5, 1.802, txt1, 'color', 'b');
text(112.5, 1.802, txt2, 'color', 'b');
legend('Vreg','location', 'best');

%legend('Vreg', 'location', 'best');
xlabel('Time, us'); ylabel('Veg, V');
xlim([108, 117]); 
%ylim([0, 2]);

%% save image
set(f1,'Units','Inches');
pos = get(f1,'Position');
set(f1,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);
print(f1, 'ldo_liner.pdf', '-dpdf');
movefile('ldo_liner.pdf','../img/ldo_liner.pdf');
