%% Iac and Power
clear all;
load('PI_sch.mat');
%load('Vs_sch.mat'); 
time = t_sch*10^6;

%%
f1 = figure(1);
from = find(1000.000 == round(time, 3), 1);
to = find(1000.500 == round(time, 3), 1);

pwr_Rs = 50 * rms(Iac_sch)^2;
pwr_sch = pwr_ac_sch + .018 - pwr_Rs;

subplot(2, 1, 1);
p1 = plot(time(from:to), Iac_sch(from:to)*10^3); hold on;
     %yyaxis right;
     %plot(time(from:to), Vin1_sch(from:to)*10^3, time(from:to), Vin2_sch(from:to)*10^3);
     hold off;
%xlabel('Time (us)'); 
ylabel('Current (mA)');
grid on;
xlim([1000, 1000.3]);
%ylim([-70, 70]);
title('Current from source', 'FontSize', 10);
Itxt1 = sprintf('Pre: I_{peak} = %.1f mA, I_{rms} = %.1f mA', max(abs(Iac_sch(from:end)))*1000, rms(Iac_sch(from:end))*1000);
legend(Itxt1, 'location', 'best');

subplot(2, 1, 2);
p2 = plot(time(from:to), pwr_sch(from:to)*10^3); hold on;
     hold off;
xlabel('Time (us)'); 
ylabel('Power (mW)');
grid on;
xlim([1000, 1000.3]);
%ylim([0, 35]);
title('Power from source', 'FontSize', 10);
Ptxt1 = sprintf('Pre: P_{avg}= % .1f mW', mean(pwr_sch(from:end))*1000);
legend(Ptxt1, 'location', 'best');

%% save plot 
set(f1,'Units','Inches');
pos = get(f1,'Position');
set(f1,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);
print(f1, 'pms_PI.pdf', '-dpdf');
movefile('pms_PI.pdf','../../img/pms/pms_PI.pdf');
