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
start = 3500.000;
from = find(start == round(time, 3), 1);
to = find(start + 0.5 == round(time, 2), 1);
fromp = find(start == round(timep, 3), 1);
top = find(start + 0.5 == round(timep, 2), 1);

pwr_Rs = 50 * rms(Iac_sch)^2;
pwr_sch = pwr_ac_sch + .0178 ;%- pwr_Rs;
pwr_tot = mean(pwr_sch);
pwr_in_pri = pwr_tot -pwr_Rs;
pwr_pms = mean(pwr_pms_sch) + .0178;
pwr_Rs_pex = 50 * rms(Iac_pex)^2;
pwr_pex = pwr_ac_pex + .01781 ;%- pwr_Rs_pex;

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
p2 = plot(time(from:to), pwr_sch(from:to)*10^3, 'b'); hold on;
     plot(timep(fromp:top), pwr_pex(fromp:top)*10^3, 'r-.');
     hold off;
xlabel('Time (us)'); 
ylabel('Power (mW)');
grid on;
xlim([start, start + 0.15]);
%ylim([0, 35]);
title('Power from source', 'FontSize', 10);
Ptxt1 = sprintf('Pre: P_{avg}= % .1f mW', mean(pwr_sch(from:end))*1000);
Ptxt1p = sprintf('Post: P_{avg}= % .1f mW', mean(pwr_pex(fromp:end))*1000);
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
Iin2 = sprintf('Pre: Vin2 I_{peak} = %.1f mA, I_{rms} = %.1f mA', max(abs(Ivin2_sch(from:end)))*1000, rms(Ivin2_sch(from:end))*1000);
Iin1 = sprintf('Pre: Vin1 I_{peak} = %.1f mA, I_{rms} = %.1f mA', max(abs(Ivin1_sch(from:end)))*1000, rms(Ivin1_sch(from:end))*1000);
Iin2p = sprintf('Post: Vin2 I_{peak} = %.1f mA, I_{rms} = %.1f mA', max(abs(Ivin2_pex(fromp:end)))*1000, rms(Ivin2_pex(fromp:end))*1000);
Iin1p = sprintf('Post: Vin1 I_{peak} = %.1f mA, I_{rms} = %.1f mA', max(abs(Ivin1_pex(fromp:end)))*1000, rms(Ivin1_pex(fromp:end))*1000);
legend(Iin2, Iin1, Iin2p, Iin1p, 'location', 'best');

subplot(2, 1, 2);
plot(time(from:to), vin_sch(from:to), 'r'); hold on;
plot(time(from:to), vin1_sch(from:to), 'b', time(from:to), vin2_sch(from:to), 'c');
plot(timep(fromp:top), vin_pex(fromp:top), 'r--'); 
plot(timep(fromp:top), vin1_pex(fromp:top),'b--', timep(fromp:top), vin2_pex(fromp:top), 'c--');
hold off;
xlabel('Time (us)'); 
ylabel('Voltage (V)');
grid on;
xlim([start, start + 0.15]);
ylim([-3, 3]);
title('Rectifier voltages and currents', 'FontSize', 10);
legend('Pre Vin', 'Pre Vin1', 'Pre Vin2', 'Post Vin', 'Post Vin1', 'Post Vin2');

%% Primary voltage and currnet

Vprim_sch = vac_sch -(-Iac_sch)*50;
Vprim_pex = vac_pex -(-Iac_pex)*50;
yyaxis left;
%plot(time(from:to), vac_sch(from:to)); hold on;
plot(time, Vprim_sch, timep, Vprim_pex);
ylabel('Voltage, V');

yyaxis right;
plot(time, -Iac_sch*1000, timep, -Iac_pex*1000);

hold off;
grid on;
xlim([start, start + 0.15]);
xlabel('Time (us)'); 
ylabel('Current, mA');
legend('Pre Vprim', 'Post Vprim' ,'Pre Iprim', 'Post Iprim', 'location', 'best');
title('Voltage and Current at primary', 'FontSize', 10);


% Power calcn test
ti = time - time(1);
pwr_sch_approx = 1/ti(end)*trapz(ti, Iac_sch.*Vprim_sch);
tip = timep - timep(1);
pwr_pex_approx = 1/tip(end)*trapz(tip, Iac_pex.*Vprim_pex);

[Amp, Ph] = freqrespmeasure(Iac_sch, Vprim_sch);
pwr_sch_approx_2 = rms(Iac_sch)*rms(Vprim_sch)*cos(Ph);


%% save plot 
set(f1,'Units','Inches');
pos = get(f1,'Position');
set(f1,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);
print(f1, 'wpt_PIsrc_both.pdf', '-dpdf');
movefile('wpt_PIsrc_both.pdf','../../img/wpt/wpt_PIsrc_both.pdf');
%%
set(f2,'Units','Inches');
pos = get(f2,'Position');
set(f2,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);
print(f2, 'wpt_VIrect_both.pdf', '-dpdf');
movefile('wpt_VIrect_both.pdf','../../img/wpt/wpt_VIrect_both.pdf');


%%
ti = time - time(1);
pwr_trapz = 1/ti(end)*trapz(ti, Iac_sch.*vac_sch);
%pwr_int = 1/ti(end)*integral(Iac_sch.*vac_sch, ti(1), ti(end))
pwr_trapz1 = 1/ti(end)*trapz(ti, Ivin1_sch.*vin1_sch);
pwr_trapz2 = 1/ti(end)*trapz(ti, Ivin2_sch.*vin2_sch);

%%

