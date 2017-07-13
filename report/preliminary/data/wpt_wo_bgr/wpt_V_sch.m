% Vin1 Vin2 Vreg Vrec plot for wpt w/o bgr schematic

%% Load 
clear all;
load('V_sch.mat'); 
% data includes 0u to 350u trans

%% plot Vrec and Vreg

plotwidth = 1;
time = t_sch*10^6;
start = find(300==round(time), 1);
Vac_sch = Vin1_sch-Vin2_sch;
avg_Vrec_sch = mean(Vrec_sch(start: end));
avg_Vreg_sch = mean(Vreg_sch(start: end));
txt1 = sprintf('Schematic Vrec, Avg = %.3f V', avg_Vrec_sch);
txt2 = sprintf('Schematic Vreg, Avg = %.3f V', avg_Vreg_sch);

f1 = figure(1); % all voltage wave
p1 = plot(time, Vrec_sch, time, Vreg_sch, time, Vac_sch);
set(p1, 'linewidth', plotwidth);
grid on;
legend(txt1, txt2, 'location', 'best');
xlabel('Time (us)'); 
ylabel('Voltage (V)');
%xlim([1.5, 2.5]); 
ylim([-3, 3]);
title('Vrec and Vreg', 'FontSize', 10);

%%  Ripple plot
from = find(300==round(time), 1);
to = find(300.075==round(time, 3), 1);
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
xlim([299.5, 299.8]);
title('Rectified voltage', 'FontSize', 10);

subplot(2, 1, 2);
p3 = plot(time(from: to), Vreg_sch(from: to));
set(p3, 'linewidth', plotwidth);
legend(leg2, 'location', 'best');
xlabel('Time (us)'); 
ylabel('Voltage (V)');
grid on;
xlim([299.5, 299.8]);
title('Regulated voltage', 'FontSize', 10);

%% Vin and Vac
f3 = figure(3);
from = find(300==round(time, 3), 1);
to = find(300.075==round(time, 3), 1);
plot(time(from:to), Vin1_sch(from:to), time(from:to), Vin2_sch(from:to), time(from:to), Vac_sch(from:to));
xlabel('Time (us)'); 
ylabel('Voltage (V)');
grid on;
xlim([300, 300.074]);
title('Inputs voltages', 'FontSize', 10);

%% saving plot to a location

set(f1,'Units','Inches');
pos = get(f1,'Position');
set(f1,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);
print(f1, 'wpt_V_wo_bgr.pdf', '-dpdf');
movefile('wpt_V_wo_bgr.pdf','../../img/wpt_V_wo_bgr.pdf');

set(f2,'Units','Inches');
pos = get(f2,'Position');
set(f2,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);
print(f2, 'wpt_ripple_wo_bgr.pdf', '-dpdf');
movefile('wpt_ripple_wo_bgr.pdf','../../img/wpt_ripple_wo_bgr.pdf');
