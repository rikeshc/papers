%% Iac and Power
clear all;
load('/uio/hume/student-u18/rikeshc/Rikesh/mast/mat_files/IP_sch.mat'); 
%load('IP_pex.mat'); 
time = t_sch*10^6;
%timep = t_pex*10^6;

%%
stable = 2200.00; % Vreg and Vrec are stable after this time.
f1 = figure(1);
subplot(2, 1, 1);
from = find(stable ==round(time, 2), 1);
to = find(stable + 0.5 ==round(time, 2), 1);
%fromp = find(400.000 ==round(timep, 3), 1);
%top = find(400.500 ==round(timep, 3), 1);
p1 = plot(time(from:to), Iac_sch(from:to)*10^3, 'b'); %, timep(fromp:top), Iac_pex(fromp:top)*10^3, 'r--');
%xlabel('Time (us)'); 
ylabel('Current (mA)');
grid on;
xlim([2200, 2200.3]);
title('Current from source', 'FontSize', 10);

Itxt1 = sprintf('Pre: I_{peak} = %.1f mA, I_{rms} = %.1f mA', max(Iac_sch(from:end))*1000, rms(Iac_sch(from:end))*1000);
%Itxt2 = sprintf('Post: I_{peak} = %.1f mA, I_{rms} = %.1f mA', max(Iac_pex(fromp:end))*1000, rms(Iac_pex(fromp:end))*1000);
legend(Itxt1, 'location', 'best');

subplot(2, 1, 2);
p2 = plot(time(from:to), pwr_sch(from:to)*10^3, 'b'); %, timep(fromp:top), pwr_pex(fromp:top)*10^3, 'r--');
xlabel('Time (us)'); 
ylabel('Power (mW)');
grid on;
xlim([2200, 2200.3]);
title('Power from source', 'FontSize', 10);
Ptxt1 = sprintf('Pre: P_{avg}= % .1f mW', mean(pwr_sch(from:end))*1000);
%Ptxt2 = sprintf('Post: P_{avg} = % .1f mW', mean(pwr_pex(fromp:end))*1000);

legend(Ptxt1, 'location', 'best');

%% save plot 
set(f1,'Units','Inches');
pos = get(f1,'Position');
set(f1,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);
print(f1, 'wpt_PI.pdf', '-dpdf');
movefile('wpt_PI.pdf','../../img/wpt_PI.pdf');
