%% Iac and Power
clear all;
load('PI_sch.mat');
load('PI_pex.mat');
load('Vs_sch.mat');
load('Vs_pex.mat');

time = t_sch*10^6;
timep = t_pex*10^6;

vin_sch = vin1_sch - vin2_sch;
vin_pex = vin1_pex - vin2_pex;
%% POWER CURRENT FROM SOURCE
f1 = figure(1);
start = 1200.000;
from = find(start == round(time, 3), 1);
to = find(start + 0.5 == round(time, 2), 1);
fromp = find(start == round(timep, 3), 1);
top = find(start + 0.5 == round(timep, 2), 1);

% Power clacn
 
pwr_pad_sch = rms(Ivin2_sch)^2*2*4+0.01^2*2;
pTot_sch = mean(pwr_ac_sch) *1000 - 0.6; % 0.7 accounted for buffer and bias loss
pRs_sch = 50 * rms(Iac_sch)^2 *1000;
pIn_sch = pTot_sch - pRs_sch;
pIL_sch = mean(pwr_il_sch) *1000;
pPms_sch = (mean(pwr_pms_sch)+pwr_pad_sch)*1000;
pLoad_sch = 0.0178*1000;

pwr_pad_pex = rms(Ivin2_pex)^2*2*4+0.01^2*2;
pTot_pex = mean(pwr_ac_pex) *1000 - 0.6;
pRs_pex = 50 * rms(Iac_pex)^2 *1000;
pIn_pex = pTot_pex - pRs_pex;
pIL_pex = mean(pwr_il_pex)*1000;
pPms_pex = (mean(pwr_pms_pex) + pwr_pad_pex)*1000;
pLoad_pex = 0.01781*1000;

subplot(2, 1, 1);
p1 = plot(time(from:to), Iac_sch(from:to)*10^3, 'r'); hold on;
     %yyaxis right;
     plot(timep(fromp:top), Iac_pex(fromp:top)*10^3, 'b-.');
     hold off;
%xlabel('Time (us)'); 
ylabel('Current (mA)');
grid on;
xlim([start, start + 0.15]);
%ylim([-70, 70]);
title('Current from source', 'FontSize', 10);
Itxt1 = sprintf('Pre: I_{peak} = %.1f mA, I_{rms} = %.1f mA', max(abs(Iac_sch(from:end)))*1000, rms(Iac_sch(from:end))*1000);
Itxt1p = sprintf('Post: I_{peak} = %.1f mA, I_{rms} = %.1f mA', max(abs(Iac_pex(fromp:end)))*1000, rms(Iac_pex(fromp:end))*1000);
legend(Itxt1, Itxt1p, 'location', 'best');

subplot(2, 1, 2);
p2 = plot(time(from:to), pwr_ac_sch(from:to)*10^3, 'b'); hold on;
     plot(timep(fromp:top), pwr_ac_pex(fromp:top)*10^3, 'r-.');
     hold off;
xlabel('Time (us)'); 
ylabel('Power (mW)');
grid on;
xlim([start, start + 0.15]);
ylim([-30, 130]);
title('Power from source', 'FontSize', 10);
Ptxt1 =  sprintf('Pre:  P_{src}=%.1f, P_{Rs}=%.1f, P_{in}=%.1f, P_{il}=%.1f, P_{pms}=%.1f, P_{load}=%.1f  mW, ', pTot_sch, pRs_sch, pIn_sch, pIL_sch, pPms_sch, pLoad_sch );
Ptxt1p = sprintf('Post: P_{src}=%.1f, P_{Rs}=%.1f, P_{in}=%.1f, P_{il}=%.1f, P_{pms}=%.1f, P_{load}=%.1f  mW, ', pTot_pex, pRs_pex, pIn_pex, pIL_pex, pPms_pex, pLoad_pex );
legend(Ptxt1, Ptxt1p, 'location', 'best');


%% test power plots
f3 = figure(3);
plot(time(from:to), pwr_sch(from:to)*10^3, 'b'); hold on;
plot(timep(fromp:top), pwr_pex(fromp:top)*10^3, 'b-.');
plot(time(from:to), pwr_ac_sch(from:to)*10^3, 'r'); hold on;
plot(timep(fromp:top), pwr_ac_pex(fromp:top)*10^3, 'r-.');

hold off;
     grid on;
     
     xlim([start, start + 0.15]);


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
xlim([start, start + 0.15]);
ylim([-3, 45]);

%ylim([-70, 70]);
title('Current from source', 'FontSize', 10);
Iin2 = sprintf('Pre: Vin2, I_{peak}=%.1f mA, I_{rms}=%.1f mA', max(abs(Ivin2_sch(from:end)))*1000, rms(Ivin2_sch(from:end))*1000);
Iin1 = sprintf('Pre: Vin1, I_{peak}=%.1f mA, I_{rms}=%.1f mA', max(abs(Ivin1_sch(from:end)))*1000, rms(Ivin1_sch(from:end))*1000);
Iin2p = sprintf('Post: Vin2, I_{peak}=%.1f mA, I_{rms}=%.1f mA', max(abs(Ivin2_pex(fromp:end)))*1000, rms(Ivin2_pex(fromp:end))*1000);
Iin1p = sprintf('Post: Vin1, I_{peak}=%.1f mA, I_{rms}=%.1f mA', max(abs(Ivin1_pex(fromp:end)))*1000, rms(Ivin1_pex(fromp:end))*1000);
legend(Iin2, Iin1, Iin2p, Iin1p, 'location', 'best');

subplot(2, 1, 2);
plot(time(from:to), vin_sch(from:to), 'r'); hold on;
plot(time(from:to), vin1_sch(from:to), 'b', time(from:to), vin2_sch(from:to), 'c', time(from:to), vrec_sch(from:to), 'g');
plot(timep(fromp:top), vin_pex(fromp:top), 'r--'); 
plot(timep(fromp:top), vin1_pex(fromp:top),'b--', timep(fromp:top), vin2_pex(fromp:top), 'c--', timep(fromp:top), vrec_pex(fromp:top), 'g--');
hold off;
xlabel('Time (us)'); 
ylabel('Voltage (V)');
grid on;
xlim([start, start + 0.15]);
ylim([-3, 3]);
title('Rectifier voltages and currents', 'FontSize', 10);
legend('Pre Vin', 'Pre Vin1', 'Pre Vin2', 'Pre Vrec', 'Post Vin', 'Post Vin1', 'Post Vin2', 'Post Vrec');

%% Primary voltage and currnet

f3 = figure(3);
yyaxis left;
%plot(time(from:to), vac_sch(from:to)); hold on;
plot( time, vpri_sch, timep, vpri_pex);
ylabel('Voltage, V');

yyaxis right;
plot(time, Iac_sch*1000, timep, Iac_pex*1000);

hold off;
grid on;
xlim([start, start + 0.1505]);
xlabel('Time (us)'); 
ylabel('Current, mA');
priV =  sprintf('Pre:  V_{ac}, Peak = %.2f V, Rms = %.2f V', peak2peak(vpri_sch)/2, rms(vpri_sch));
priVp = sprintf('Post: V_{ac}, Peak = %.2f V, Rms = %.2f V', peak2peak(vpri_pex)/2, rms(vpri_pex));
priI =  sprintf('Pre: I_{ac}, Peak = %.1f mA, Rms = %.1f mA', peak2peak(Iac_sch)/2*1000, rms(Iac_sch)*1000);
priIp =  sprintf('Post: I_{ac}, Peak = %.1f mA, Rms = %.1f mA', peak2peak(Iac_pex)/2*1000, rms(Iac_pex)*1000);


legend(priV, priVp, priI, priIp, 'location', 'best');
title('Voltage and Current at primary', 'FontSize', 10);


%% save plot 
set(f1,'Units','Inches');
pos = get(f1,'Position');
set(f1,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);
print(f1, 'wpt_PIsrc_both.pdf', '-dpdf');
movefile('wpt_PIsrc_both.pdf','../../img/wpt/wpt_PIsrc_both.pdf');
%% diode current
set(f2,'Units','Inches');
pos = get(f2,'Position');
set(f2,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);
print(f2, 'wpt_VIrect_both.pdf', '-dpdf');
movefile('wpt_VIrect_both.pdf','../../img/wpt/wpt_VIrect_both.pdf');


%% primiary voltage and current
set(f3,'Units','Inches');
pos = get(f3,'Position');
set(f3,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);
print(f3, 'wpt_priVI_both.pdf', '-dpdf');
movefile('wpt_priVI_both.pdf','../../img/wpt/wpt_priVI_both.pdf');

%%

pin_totl = mean(vac_sch.*Iac_sch)
pin_rect = sqrt(mean(vin1_sch.*Ivin1_sch)^2+mean(vin2_sch.*Ivin2_sch)^2)
pin_prim = mean(vpri_sch.*Iac_sch)
