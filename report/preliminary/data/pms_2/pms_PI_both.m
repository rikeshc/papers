%% Iac and Power
clear all;
load('PI_sch.mat');
load('PI_pex.mat');
load('Vs_sch.mat');
load('Vs_pex.mat'); 
time = t_sch*10^6;
timep = t_pex*10^6;

%% POWER CURRENT FROM SOURCE
f1 = figure(1);
from = find(1200.000 == round(time, 3), 1);
to = find(1200.500 == round(time, 2), 1);
fromp = find(1200.000 == round(timep, 3), 1);
top = find(1200.500 == round(timep, 2), 1);

pwr_Rs = 50 * rms(Iac_sch)^2;
pwr_sch = pwr_ac_sch + .0178;   % - pwr_Rs;
pwr_Rs_pex = 50 * rms(Iac_pex)^2;
pwr_pex = pwr_ac_pex + .01781; % - pwr_Rs_pex;

subplot(2, 1, 1);
p1 = plot(time(from:to), Iac_sch(from:to)*10^3, 'r'); hold on;
     %yyaxis right;
     plot(timep(fromp:top), Iac_pex(fromp:top)*10^3, 'b-.');
     hold off;
%xlabel('Time (us)'); 
ylabel('Current (mA)');
grid on;
xlim([1200, 1200.3]);
%ylim([-70, 70]);
title('Current from source', 'FontSize', 10);
Itxt1 = sprintf('Pre: I_{peak} = %.1f mA, I_{rms} = %.1f mA', max(abs(Iac_sch(from:end)))*1000, rms(Iac_sch(from:end))*1000);
Itxt1p = sprintf('Post: I_{peak} = %.1f mA, I_{rms} = %.1f mA', max(abs(Iac_pex(fromp:end)))*1000, rms(Iac_pex(fromp:end))*1000);
legend(Itxt1, Itxt1p, 'location', 'best');

subplot(2, 1, 2);
p2 = plot(time(from:to), pwr_sch(from:to)*10^3, 'b'); hold on;
     plot(timep(fromp:top), pwr_pex(fromp:top)*10^3, 'r-.');
     hold off;
xlabel('Time (us)'); 
ylabel('Power (mW)');
grid on;
xlim([1200, 1200.3]);
%ylim([0, 35]);
title('Power from source', 'FontSize', 10);
Ptxt1 = sprintf('Pre: P_{avg}= % .1f mW', mean(pwr_sch(from:end))*1000);
Ptxt1p = sprintf('Post: P_{avg}= % .1f mW', mean(pwr_pex(fromp:end))*1000);
legend(Ptxt1, Ptxt1p, 'location', 'best');

%% VOLTAGE CURRENT
f2 = figure(2);
subplot(2, 1, 1);
p3 = plot(time(from:end), Ivin2_sch(from:end)*10^3, 'r'); hold on;
     plot(time(from:end), Ivin1_sch(from:end)*10^3, 'b');
     plot(timep(fromp:end), Ivin2_pex(fromp:end)*10^3, 'm-.');
     plot(timep(fromp:end), Ivin1_pex(fromp:end)*10^3, 'c-.');
     
     hold off;
%xlabel('Time (us)'); 
ylabel('Current (mA)');
grid on;
xlim([1200, 1200.15]);
ylim([-3, 32]);

%ylim([-70, 70]);
title('Current from source', 'FontSize', 10);
Iin2 = sprintf('Pre: Vin2 I_{peak} = %.1f mA, I_{rms} = %.1f mA', max(abs(Ivin2_sch(from:end)))*1000, rms(Ivin2_sch(from:end))*1000);
Iin1 = sprintf('Pre: Vin1 I_{peak} = %.1f mA, I_{rms} = %.1f mA', max(abs(Ivin1_sch(from:end)))*1000, rms(Ivin1_sch(from:end))*1000);
Iin2p = sprintf('Post: Vin2 I_{peak} = %.1f mA, I_{rms} = %.1f mA', max(abs(Ivin2_pex(fromp:end)))*1000, rms(Ivin2_pex(fromp:end))*1000);
Iin1p = sprintf('Post: Vin1 I_{peak} = %.1f mA, I_{rms} = %.1f mA', max(abs(Ivin1_pex(fromp:end)))*1000, rms(Ivin1_pex(fromp:end))*1000);
legend(Iin2, Iin1, Iin2p, Iin1p, 'location', 'best');

subplot(2, 1, 2);
plot(time(from:to), Vac_sch(from:to), 'g',  time(from:to), Vpri_sch(from:to), 'r'); hold on;
plot(time(from:to), Vin1_sch(from:to), 'b', time(from:to), Vin2_sch(from:to), 'c');
plot(timep(fromp:top), Vpri_pex(fromp:top), 'r--'); 
plot(timep(fromp:top), Vin1_pex(fromp:top),'b--', timep(fromp:top), Vin2_pex(fromp:top), 'c--');
hold off;
xlabel('Time (us)'); 
ylabel('Voltage (V)');
grid on;
xlim([1200, 1200.150]);
ylim([-4.4, 4.4]);
title('Rectifier voltages and currents', 'FontSize', 10);
legend('Vac', 'Pre Vin', 'Pre Vin1', 'Pre Vin2', 'Post Vin', 'Post Vin1', 'Post Vin2');


%% save plot 
set(f1,'Units','Inches');
pos = get(f1,'Position');
set(f1,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);
print(f1, 'pms_PIsrc_both.pdf', '-dpdf');
movefile('pms_PIsrc_both.pdf','../../img/pms/pms_PIsrc_both.pdf');
%%
set(f2,'Units','Inches');
pos = get(f2,'Position');
set(f2,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);
print(f2, 'pms_VIrect_both.pdf', '-dpdf');
movefile('pms_VIrect_both.pdf','../../img/pms/pms_VIrect_both.pdf');
