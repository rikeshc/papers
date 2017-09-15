
%% Vrec and Vreg
clear all;
load('Vout_sch.mat'); % transient from 0 to end time
load('Vout_pex.mat');

%% plot Vrec and Vreg for full time

plotwidth = 1;
time = t_sch*10^6;
timep = t_pex*10^6;
start = find(1200.000 == round(time, 3), 1);
startp = find(1200.000 == round(time, 3), 1);

avg_Vrec_sch = mean(Vrec_sch(start: end));
avg_Vreg_sch = mean(Vreg_sch(start: end));
avg_Vrec_pex = mean(Vrec_pex(startp: end));
avg_Vreg_pex = mean(Vreg_pex(startp: end));

txt1 = sprintf('Pre Vrec, Avg = %.3f V', avg_Vrec_sch);
txt2 = sprintf('Pre Vreg, Avg = %.3f V', avg_Vreg_sch);
txt1p = sprintf('Post Vrec, Avg = %.3f V', avg_Vrec_pex);
txt2p = sprintf('Post Vreg, Avg = %.3f V', avg_Vreg_pex);

f1 = figure(1); 
p1 = plot(time, Vrec_sch, 'r', time, Vreg_sch, 'b'); hold on; % pre
     plot(timep, Vrec_pex, 'b--' , timep, Vreg_pex, 'r--'); 
     hold off;
set(p1, 'linewidth', plotwidth);
grid on;
legend(txt1, txt2, txt1p, txt2p, 'location', 'best');
xlabel('Time (us)'); 
ylabel('Voltage (V)');
%xlim([1.5, 2.5]); 
%ylim([-3, 3]);
title('Vrec and Vreg', 'FontSize', 10);

%%  All voltage plots
clear all;
load('Vs_sch.mat')
load('Vs_pex.mat')

plotwidth = 1;
time = t_sch*10^6;
from = find(1200.000 == round(time, 3), 1);
to = find(1200.150 == round(time, 3), 1);
timep = t_pex*10^6;
fromp = find(1200.000 == round(timep, 3), 1);
top = find(1200.150 == round(timep, 3), 1);

% Ripple in Vrec and Vreg
rip_Vrec_sch = max(Vrec_sch(from:to))-min(Vrec_sch(from:to));
rip_Vreg_sch = max(Vreg_sch(from:to))-min(Vreg_sch(from:to));
rip_Vrec_pex = max(Vrec_pex(fromp:top))-min(Vrec_pex(fromp:top));
rip_Vreg_pex = max(Vreg_pex(fromp:top))-min(Vreg_pex(fromp:top));
leg1 = sprintf('Pre ripple = %.2f mV', rip_Vrec_sch*1000);
leg2 = sprintf('Pre ripple = %.2f mV', rip_Vreg_sch*1000);
leg1p = sprintf('Post ripple = %.2f mV', rip_Vrec_pex*1000);
leg2p = sprintf('Post ripple = %.2f mV', rip_Vreg_pex*1000);

f2 = figure(2); % ripple
subplot(2, 1, 1);
p2 = plot(time(from: to), Vrec_sch(from: to), 'r'); hold on;
     plot(timep(fromp: top), Vrec_pex(fromp: top), 'r--');
    hold off;
set(p2, 'linewidth', plotwidth);
legend(leg1, leg1p, 'location', 'best');
%xlabel('time (us)'); 
ylabel('Voltage (V)');
grid on;
xlim([1200, 1200.15]);
%ylim([2.35, 2.4]);
title('Rectified voltage', 'FontSize', 10);

subplot(2, 1, 2);
p3 = plot(time(from: to), Vreg_sch(from: to), 'b'); hold on;
      plot(timep(fromp: top), Vreg_pex(fromp: top), 'b--');
      hold off;
set(p3, 'linewidth', plotwidth);
legend(leg2, leg2p,'location', 'best');
xlabel('Time (us)'); 
ylabel('Voltage (V)');
grid on;
xlim([1200, 1200.15]);
%ylim([1.799, 1.801]);
title('Regulated voltage', 'FontSize', 10);

%% Vs all
f3 = figure(3);

plot(time(from:to), Vac_sch(from:to), 'g',  time(from:to), Vpri_sch(from:to), 'r'); hold on;
plot(time(from:to), Vin1_sch(from:to), 'b', time(from:to), Vin2_sch(from:to), 'c');
plot(timep(fromp:top), Vpri_pex(fromp:top), 'r--'); 
plot(timep(fromp:top), Vin1_pex(fromp:top),'b--', timep(fromp:top), Vin2_pex(fromp:top), 'c--');
hold off;
xlabel('Time (us)'); 
ylabel('Voltage (V)');
grid on;
xlim([1200, 1200.150]);
title('Inputs voltages', 'FontSize', 10);
legend('Vac', 'Pre Vin', 'Pre Vin1', 'Pre Vin2', 'Post Vin', 'Post Vin1', 'Post Vin2');

%% saving plot to a location

set(f1,'Units','Inches');
pos = get(f1,'Position');
set(f1,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);
print(f1, 'pms_Vout.pdf', '-dpdf');
movefile('pms_Vout.pdf','../../img/pms/pms_Vout_both.pdf');

%%
set(f2,'Units','Inches');
pos = get(f2,'Position');
set(f2,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);
print(f2, 'pms_ripple.pdf', '-dpdf');
movefile('pms_ripple.pdf','../../img/pms/pms_ripple_both.pdf');
%%
set(f3,'Units','Inches');
pos = get(f3,'Position');
set(f3,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);
print(f3, 'pms_Vs.pdf', '-dpdf');
movefile('pms_Vs.pdf','../../img/pms/pms_Vs_both.pdf');
