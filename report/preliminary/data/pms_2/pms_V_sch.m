
%% Vrec and Vreg
clear all;
load('Vout_sch.mat'); % transient from 0 to end time

%% plot Vrec and Vreg for full time

plotwidth = 1;
time = t_sch*10^6;
start = find(800.000 == round(time, 3), 1);
%Vac_sch = Vin1_sch-Vin2_sch;
avg_Vrec_sch = mean(Vrec_sch(start: end));
avg_Vreg_sch = mean(Vreg_sch(start: end));
txt1 = sprintf('Schematic Vrec, Avg = %.3f V', avg_Vrec_sch);
txt2 = sprintf('Schematic Vreg, Avg = %.3f V', avg_Vreg_sch);

f1 = figure(1); 
p1 = plot(time, Vrec_sch, time, Vreg_sch);
set(p1, 'linewidth', plotwidth);
grid on;
legend(txt1, txt2, 'location', 'best');
xlabel('Time (us)'); 
ylabel('Voltage (V)');
%xlim([1.5, 2.5]); 
%ylim([-3, 3]);
title('Vrec and Vreg', 'FontSize', 10);

%%  All voltage plots
clear all;
load('Vs_sch.mat')

plotwidth = 1;
time = t_sch*10^6;
from = find(1000.000 == round(time, 3), 1);
to = find(1000.150 == round(time, 3), 1);

% Ripple in Vrec and Vreg
rip_Vrec_sch = max(Vrec_sch(from:to))-min(Vrec_sch(from:to));
rip_Vreg_sch = max(Vreg_sch(from:to))-min(Vreg_sch(from:to));
leg1 = sprintf('Schematic ripple = %.2f mV', rip_Vrec_sch*1000);
leg2 = sprintf('Schematic ripple = %.2f mV', rip_Vreg_sch*1000);

f2 = figure(2); % ripple
subplot(2, 1, 1);
p2 = plot(time(from: to), Vrec_sch(from: to)); hold on;
    %plot(time(from: to), Vac_sch(from: to));
    hold off;
set(p2, 'linewidth', plotwidth);
legend(leg1, 'location', 'best');
%xlabel('time (us)'); 
ylabel('Voltage (V)');
grid on;
xlim([1000, 1000.15]);
ylim([2.35, 2.4]);
title('Rectified voltage', 'FontSize', 10);

subplot(2, 1, 2);
p3 = plot(time(from: to), Vreg_sch(from: to));
set(p3, 'linewidth', plotwidth);
legend(leg2, 'location', 'best');
xlabel('Time (us)'); 
ylabel('Voltage (V)');
grid on;
xlim([1000, 1000.15]);
ylim([1.799, 1.801]);
title('Regulated voltage', 'FontSize', 10);

%% Vs all
f3 = figure(3);

plot(time(from:to), Vac_sch(from:to),  time(from:to), Vpri_sch(from:to)); hold on;
plot(time(from:to), Vin1_sch(from:to), time(from:to), Vin2_sch(from:to));
%plot(time(from:to), Vrec_sch(from:to), time(from:to), Vreg_sch(from:to));
hold off;
xlabel('Time (us)'); 
ylabel('Voltage (V)');
grid on;
xlim([1000, 1000.150]);
title('Inputs voltages', 'FontSize', 10);
legend('Vac', 'Vin', 'Vin1', 'Vin2');

%% saving plot to a location

set(f1,'Units','Inches');
pos = get(f1,'Position');
set(f1,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);
print(f1, 'pms_Vout.pdf', '-dpdf');
movefile('pms_Vout.pdf','../../img/pms/pms_Vout.pdf');

%%
set(f2,'Units','Inches');
pos = get(f2,'Position');
set(f2,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);
print(f2, 'pms_ripple.pdf', '-dpdf');
movefile('pms_ripple.pdf','../../img/pms/pms_ripple.pdf');
%%
set(f3,'Units','Inches');
pos = get(f3,'Position');
set(f3,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);
print(f3, 'pms_Vs.pdf', '-dpdf');
movefile('pms_Vs.pdf','../../img/pms/pms_Vs.pdf');
