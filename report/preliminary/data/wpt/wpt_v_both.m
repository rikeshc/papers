%% Load 
clear all;
load('Vout_sch.mat');
load('Vout_pex.mat');
time = t_sch*10^6;
timep = t_pex*10^6;

%% plot Vrec and Vreg

plotwidth = 1;
stable = 3500;
from = find(stable ==round(time, 2), 1);
to = find(stable + 0.5 ==round(time, 2), 1);
fromp = find(stable ==round(timep, 2), 1);
top = find(stable + 0.5 ==round(timep, 2), 1);

%vac_rect_sch = vin1_sch-vin2_sch;
%vac_rect_pex = vin1_pex-vin2_pex;

avg_vrec_sch = mean(vrec_sch(from: end));
avg_vreg_sch = mean(vreg_sch(from: end));
avg_vrec_pex = mean(vrec_pex(fromp: end));
avg_vreg_pex = mean(vreg_pex(fromp: end));

txt1 = sprintf('Pre V_{rec}, Avg = %.3f V', avg_vrec_sch);
txt2 = sprintf('Pre V_{reg}, Avg = %.3f V', avg_vreg_sch);
txt1p = sprintf('Post V_{rec}, Avg = %.3f V', avg_vrec_pex);
txt2p = sprintf('Post V_{reg}, Avg = %.3f V', avg_vreg_pex);

f1 = figure(1); % all voltage wave
p1 = plot(time, vrec_sch, time, vreg_sch, timep, vrec_pex, timep, vreg_pex);
set(p1, 'linewidth', plotwidth);
grid on;
legend(txt1, txt2, txt1p, txt2p, 'location', 'best');
xlabel('Time (us)'); 
ylabel('Voltage (V)');
%xlim([-0.1, 2.5]); 
ylim([-.1, 2.5]);
title('Vrec and Vreg', 'FontSize', 10);

%%  Ripple plot

clear all;
load('Vs_sch.mat');
load('Vs_pex.mat');
time = t_sch*10^6;
timep = t_pex*10^6;

%%
plotwidth = 1;
stable = 3500;
from = find(stable ==round(time, 2), 1);
to = find(stable + 0.5 ==round(time, 2), 1);
fromp = find(stable ==round(timep, 2), 1);
top = find(stable + 0.5 ==round(timep, 2), 1);

rip_Vrec_sch = max(vrec_sch(from:to))-min(vrec_sch(from:to));
rip_Vreg_sch = max(vreg_sch(from:to))-min(vreg_sch(from:to));
rip_Vrec_pex = max(vrec_pex(from:to))-min(vrec_pex(fromp:top));
rip_Vreg_pex = max(vreg_pex(from:to))-min(vreg_pex(fromp:top));
leg1 = sprintf('Pre ripple = %.2f mV', rip_Vrec_sch*1000);
leg2 = sprintf('Pre ripple = %.2f mV', rip_Vreg_sch*1000);
leg1p = sprintf('Post ripple = %.2f mV', rip_Vrec_pex*1000);
leg2p = sprintf('Post ripple = %.2f mV', rip_Vreg_pex*1000);

f2 = figure(2); % ripple
subplot(2, 1, 1);
p2 = plot(time(from: to), vrec_sch(from: to)); hold on;
    plot(timep(fromp: top), vrec_pex(fromp: top));
    hold off;
set(p2, 'linewidth', plotwidth);
legend(leg1, leg1p, 'location', 'best');
%xlabel('time (us)'); 
ylabel('Voltage (V)');
grid on;
xlim([3500, 3500.15]);
ylim([2.15, 2.25]);
title('Rectified voltage, V_{rec}', 'FontSize', 10);

subplot(2, 1, 2);
p3 = plot(time(from: to), vreg_sch(from: to)); hold on;
    plot(timep(fromp: top), vreg_pex(fromp: top));
    hold off;
set(p3, 'linewidth', plotwidth);
legend(leg2, leg2p, 'location', 'best');
xlabel('Time (us)'); 
ylabel('Voltage (V)');
grid on;
xlim([3500, 3500.15]);
ylim([1.778, 1.783]);
title('Regulated voltage, V_{reg}', 'FontSize', 10);

%% Vin and Vac
f3 = figure(3);
time = time - time(1);
timep = timep - timep(1);
vin_sch = vin1_sch - vin2_sch;
vin_pex = vin1_pex - vin2_pex;
plot(time(from:to), vac_sch(from:to), 'm', time(from:to), vin_sch(from:to), 'r', time(from:to), vin1_sch(from:to), 'g', time(from:to), vin2_sch(from:to), 'b'); hold on;
%plot(timep(fromp:top), vac_pex(fromp:top), 'm--', timep(fromp:top), vac_rect_pex(fromp:top), 'r--', timep(fromp:top), vin1_pex(fromp:top), 'g--', timep(fromp:top), vin2_pex(fromp:top), 'b--');
plot(timep(fromp:top), vin_pex(fromp:top), 'r--', timep(fromp:top), vin1_pex(fromp:top), 'g--', timep(fromp:top), vin2_pex(fromp:top), 'b--');

hold off;
xlabel('Time (us)'); 
ylabel('Voltage (V)');
grid on;
xlim([0, .16]);
ylim([-5.6, 5.6]);
title('Inputs voltages', 'FontSize', 10);
legend('Vac', 'Pre Vin', 'Pre Vin1', 'Pre Vin2', 'Post Vin', 'Post Vin1', 'Post Vin2', 'location', 'best');

%% saving plot to a location

set(f1,'Units','Inches');
pos = get(f1,'Position');
set(f1,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);
print(f1, 'wpt_Vout_both.pdf', '-dpdf');
movefile('wpt_Vout_both.pdf','../../img/wpt/wpt_Vout_both.pdf');
%%
set(f2,'Units','Inches');
pos = get(f2,'Position');
set(f2,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);
print(f2, 'wpt_ripple_both.pdf', '-dpdf');
movefile('wpt_ripple_both.pdf','../../img/wpt/wpt_ripple_both.pdf');
%%
set(f3,'Units','Inches');
pos = get(f3,'Position');
set(f3,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);
print(f3, 'wpt_inputs_both.pdf', '-dpdf');
movefile('wpt_inputs_both.pdf','../../img//wpt/wpt_inputs_both.pdf');
