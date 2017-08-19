%% Load 
clear all;
load('/uio/hume/student-u18/rikeshc/Rikesh/mast/mat_files/V_sch.mat'); 

%% plot Vrec and Vreg

plotwidth = 1;
time = t_sch*10^6;
start = find(2200 == round(time, 2), 1);
vac_rect_sch = vin1_sch-vin2_sch;
avg_vrec_sch = mean(vrec_sch(start: end));
avg_vreg_sch = mean(vreg_sch(start: end));
txt1 = sprintf('Schematic Vrec, Avg = %.3f V', avg_vrec_sch);
txt2 = sprintf('Schematic Vreg, Avg = %.3f V', avg_vreg_sch);

f1 = figure(1); % all voltage wave
p1 = plot(time, vrec_sch, time, vreg_sch); % time, vac_sch);
set(p1, 'linewidth', plotwidth);
grid on;
legend(txt1, txt2, 'location', 'best');
xlabel('Time (us)'); 
ylabel('Voltage (V)');
%xlim([1.5, 2.5]); 
%ylim([-3, 3]);
title('Vrec and Vreg', 'FontSize', 10);

%%  Ripple plot
from = find(2200.00 == round(time, 2), 1);
to = find(2200.3 == round(time, 2), 1);
rip_Vrec_sch = max(vrec_sch(from:to))-min(vrec_sch(from:to));
rip_Vreg_sch = max(vreg_sch(from:to))-min(vreg_sch(from:to));
leg1 = sprintf('Schematic ripple = %.2f mV', rip_Vrec_sch*1000);
leg2 = sprintf('Schematic ripple = %.2f mV', rip_Vreg_sch*1000);

f2 = figure(2); % ripple
subplot(2, 1, 1);
p2 = plot(time(from: to), vrec_sch(from: to)); hold on;
    %plot(time(from: to), vac_rect_sch(from: to));
    hold off;
set(p2, 'linewidth', plotwidth);
legend(leg1, 'location', 'best');
%xlabel('time (us)'); 
ylabel('Voltage (V)');
grid on;
xlim([2200, 2200.3]);
ylim([2.25, 2.35]);
title('Rectified voltage', 'FontSize', 10);

subplot(2, 1, 2);
p3 = plot(time(from: to), vreg_sch(from: to));
set(p3, 'linewidth', plotwidth);
legend(leg2, 'location', 'best');
xlabel('Time (us)'); 
ylabel('Voltage (V)');
grid on;
xlim([2200, 2200.3]);
ylim([1.799, 1.801]);
title('Regulated voltage', 'FontSize', 10);

%% Vin and Vac
f3 = figure(3);
from = find(2200.00 ==round(time, 2), 1);
to = find(2200.2==round(time, 2), 1);
plot(time(from:to), vac_sch(from:to), time(from:to), vac_rect_sch(from:to), time(from:to), vin1_sch(from:to), time(from:to), vin2_sch(from:to));
xlabel('Time (us)'); 
ylabel('Voltage (V)');
grid on;
xlim([2200, 2200.16]);
title('Inputs voltages', 'FontSize', 10);
legend('Vac (source)', 'Vin (rectifier)', 'Vin1', 'Vin2', 'location', 'best');

%% saving plot to a location

set(f1,'Units','Inches');
pos = get(f1,'Position');
set(f1,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);
print(f1, 'wpt_V.pdf', '-dpdf');
movefile('wpt_V.pdf','../../img/wpt_V.pdf');

set(f2,'Units','Inches');
pos = get(f2,'Position');
set(f2,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);
print(f2, 'wpt_ripple.pdf', '-dpdf');
movefile('wpt_ripple.pdf','../../img/wpt_ripple.pdf');

set(f3,'Units','Inches');
pos = get(f3,'Position');
set(f3,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);
print(f3, 'wpt_inputs.pdf', '-dpdf');
movefile('wpt_inputs.pdf','../../img/wpt_inputs.pdf');
