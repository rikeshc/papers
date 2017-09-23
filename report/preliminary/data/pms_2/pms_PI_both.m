%% Iac and Power
clear all;
load('PI_sch.mat');
load('PI_pex.mat');
timepp = t_pex*10^6;
load('Vs_sch.mat');
load('Vs_pex.mat'); 
time = t_sch*10^6;
timep = t_pex*10^6;

%% POWER CURRENT FROM SOURCE
f1 = figure(1);
from = find(600.000 == round(time, 3), 1);
to = find(600.500 == round(time, 2), 1);
fromp = find(600.000 == round(timep, 3), 1);
top = find(600.500 == round(timep, 2), 1);

pwr_sch = pwr_ac_sch + .0178 - 0.0007;
pwr_pad_sch = rms(Ivin2_sch)^2*2*4+0.01^2*2*2;
pPms_sch = (mean(pwr_pms_sch)+pwr_pad_sch)*1000;
pLoad_sch = 0.0178*1000;

pwr_pex = pwr_ac_pex + .01781 - 0.0007;
pwr_pad_pex = rms(Ivin2_pex)^2*2*4+0.01^2*2*2;
pPms_pex = (mean(pwr_pms_pex)+pwr_pad_pex)*1000;
pLoad_pex = 0.0178*1000;

subplot(2, 1, 1);
p1 = plot(time(from:to), Iac_sch(from:to)*10^3, 'r'); hold on;
     %yyaxis right;
     plot(timep(fromp:top), Iac_pex(fromp:top)*10^3, 'b-.');
     hold off;
%xlabel('Time (us)'); 
ylabel('Current (mA)');
grid on;
xlim([600, 600.3]);
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
xlim([600, 600.3]);
%ylim([0, 35]);
title('Power from source', 'FontSize', 10);
Ptxt1 =  sprintf('Pre:  P_{src}=%.1f, P_{pms}=%.1f, P_{load}=%.1f mW', mean(pwr_sch(from:end))*1000, pPms_sch, pLoad_sch);
Ptxt1p = sprintf('Post: P_{src}=%.1f, P_{pms}=%.1f, P_{load}=%.1f mW', mean(pwr_pex(fromp:end-1))*1000, pPms_pex, pLoad_pex);
legend(Ptxt1, Ptxt1p, 'location', 'best');

%% VOLTAGE CURRENT
f2 = figure(2);
subplot(2, 1, 1);
p3 = plot(time,  Ivin2_sch*10^3, 'r'); hold on;
     plot(time,  Ivin1_sch*10^3, 'b');
     
     plot(timepp, Ivin2_pex*10^3, 'm-.');
     plot(timepp, Ivin1_pex*10^3, 'c-.');
     
     hold off;
%xlabel('Time (us)'); 
ylabel('Current (mA)');
grid on;
xlim([600, 600.15]);
ylim([-3, 45]);

%ylim([-70, 70]);
title('Current from source', 'FontSize', 10);
Iin2 = sprintf('Pre: Vin2 I_{p}=%.1f mA, I_{r}=%.1f mA', max(abs(Ivin2_sch(from:end)))*1000, rms(Ivin2_sch(from:end))*1000);
Iin1 = sprintf('Pre: Vin1 I_{p}=%.1f mA, I_{r}=%.1f mA', max(abs(Ivin1_sch(from:end)))*1000, rms(Ivin1_sch(from:end))*1000);
Iin2p = sprintf('Post: Vin2 I_{p}=%.1f mA, I_{r}=%.1f mA', max(abs(Ivin2_pex(fromp:end)))*1000, rms(Ivin2_pex(fromp:end))*1000);
Iin1p = sprintf('Post: Vin1 I_{p}=%.1f mA, I_{r}=%.1f mA', max(abs(Ivin1_pex(fromp:end)))*1000, rms(Ivin1_pex(fromp:end))*1000);
legend(Iin2, Iin1, Iin2p, Iin1p, 'location', 'best');

subplot(2, 1, 2);

plot(time(from:to), Vin_sch(from:to), 'r'); hold on;
plot(time(from:to), Vin1_sch(from:to), 'b', time(from:to), Vin2_sch(from:to), 'c'); hold on
plot(time(from:to), Vrec_sch(from:to), 'g'); 
plot(timep(fromp:top), Vin1_pex(fromp:top),'b--', timep(fromp:top), Vin2_pex(fromp:top), 'c--');
plot(timep(fromp:top), Vrec_pex(fromp:top), 'g--');
hold off;
xlabel('Time (us)'); 
ylabel('Voltage (V)');
grid on;
xlim([600, 600.150]);
ylim([-0.25, 2.7]);
title('Rectifier voltages and currents', 'FontSize', 10);
legend('Vin', 'Pre Vin1', 'Pre Vin2', 'Pre Vrec', 'Post Vin1', 'Post Vin2', 'Post Vrec', 'location', 'best');


%% save plot 
set(f1,'Units','Inches');
pos = get(f1,'Position');
set(f1,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);
print(f1, 'pms_PIsrc_both.pdf', '-dpdf');
movefile('pms_PIsrc_both.pdf','../../img/pms/pms2_PIsrc_both.pdf');
%%
set(f2,'Units','Inches');
pos = get(f2,'Position');
set(f2,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);
print(f2, 'pms_VIrect_both.pdf', '-dpdf');
movefile('pms_VIrect_both.pdf','../../img/pms/pms2_VIrect_both.pdf');

%%
yyaxis left
plot(time, Vac_sch);

yyaxis right
plot(time, Iac_sch*1000);

xlim([600  , 600.150]);
grid on;

mean(Vac_sch.*Iac_sch)

