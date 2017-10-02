% Rectifier Vs and Is for schematic to see conduciton 

%% Load variables
clear all;
load('Vs_sch.mat');
load('Vs_pex.mat');
time = (t_sch-t_sch(1))*10^9;
timep = (t_pex-t_pex(1))*10^9;

load('I_sch.mat');
load('I_pex_mod.mat');
timei = (t_sch-t_sch(1))*10^9;
timeip = (t_pex-t_pex(1))*10^9;

%% one diode in each half
f1 = figure;
%f3 = figure('Position', [100, 100, 1024, 1200]); 
s1 = subplot(2, 1, 1);
p1 = plot(time, Vin_sch, 'r', time, Vin1_sch, 'b', time, Vin2_sch, 'm', time, Vrec_sch, 'g'); hold on;
p2 = plot(timep, Vin1_pex, 'b--', timep, Vin2_pex, 'm--', timep, Vrec_pex, 'g--'); hold off;     
xlim([150, 300]);
ylim([-2.7, 2.7]);
grid on;
legend('Vin', 'Schematic: Vin1', 'Schematic: Vin2', 'Schematic: Vrec', 'Post-layout: Vin1', 'Post-layout: Vin2', 'Post-layout: Vrec','location', 'best');
xlabel('time (ns)'); ylabel('Voltage (V)');
title('Rectifier voltages @10.5 mA load', 'FontSize', 10);

s2 = subplot(2, 1, 2);
p1i = plot(timei, Ivin1_sch*1000, 'r', timei, Ivin2_sch*1000, 'b'); hold on;
p2i = plot(timeip, Ivin1_pex*1000, 'r--', timeip, Ivin2_pex*1000, 'b--'); hold off;
title('Diode currents', 'FontSize', 10);
ylim([-5, 65]);
xlim([150, 300]);
Iin2 = sprintf('Pre: Vin2 I_{p}=%.1f mA, I_{r}=%.1f mA', max(abs(Ivin2_sch))*1000, rms(Ivin2_sch)*1000);
Iin1 = sprintf('Pre: Vin1 I_{p}=%.1f mA, I_{r}=%.1f mA', max(abs(Ivin1_sch))*1000, rms(Ivin1_sch)*1000);
Iin2p = sprintf('Post: Vin2 I_{p}=%.1f mA, I_{r}=%.1f mA', max(abs(Ivin2_pex))*1000, rms(Ivin2_pex)*1000);
Iin1p = sprintf('Post: Vin1 I_{p}=%.1f mA, I_{r}=%.1f mA', max(abs(Ivin1_pex))*1000, rms(Ivin1_pex)*1000);
legend(Iin2, Iin1, Iin2p, Iin1p, 'location', 'best');
grid on;

%% saving plot to a location
set(f1,'Units','Inches');
pos = get(f1,'Position');
set(f1,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);
print(f1, 'rectifier_VI.pdf', '-dpdf');
%movefile('rectifier_VI.pdf','../img/rectifier_VI.pdf');
