%% All primary currnets and voltages

clear all;
R_sense = 5;
vpri_1 = importdata('pri_1mm.dat');
drop_1 = importdata('drop_1mm.dat');
Iac1 = drop_1(:,2)/R_sense*1000;

vpri_5 = importdata('pri_5mm.dat');
drop_5 = importdata('drop_5mm.dat');
Iac5 = drop_5(:,2)/R_sense*1000;

vpri_10 = importdata('pri_10mm.dat');
drop_10 = importdata('drop_10mm.dat');
Iac10 = drop_10(:,2)/R_sense*1000;

t1 = vpri_1(:,1)*10^9; % time in ns
t5 = vpri_5(:,1)*10^9; % time in ns
t10 = vpri_10(:,1)*10^9; % time in ns
time1 = t1-(t1(1));
time5 = t5-(t5(1));
time10 = t10-(t10(1));

f1 = figure(1);
yyaxis left;
plot(time1, vpri_1(:,2), time5, vpri_5(:,2), time10, vpri_10(:,2), '-.'); hold on;
ylabel('Voltage, V');

yyaxis right;
plot(time1, Iac1, time5, Iac5, time10, Iac10, '-.'); 
legend('V_{ac}: 1.5 mm', 'V_{ac}: 5 mm', 'V_{ac}: 10 mm', 'I_{ac}: 1.5 mm', 'I_{ac}: 5 mm', 'I_{ac}: 10 mm');

hold off;
xlim([30, 200]);
xlabel('Time, ns');
ylabel('Current, mA');
grid on;


pwr_meas1 = 1/(time1(end)-time1(1))  *trapz(time1,  Iac1.*vpri_1(:,2));
pwr_meas1_rms = rms(Iac1).*rms(vpri_1(:,2));
pwr_meas5 = 1/(time5(end)-time5(1))  *trapz(time5,  Iac5.*vpri_5(:,2));
pwr_meas5_rms = rms(Iac5).*rms(vpri_5(:,2));
pwr_meas10 = 1/(time10(end)-time10(1))  *trapz(time10,  Iac10.*vpri_10(:,2));
pwr_meas10_rms = rms(Iac10).*rms(vpri_10(:,2));

title('WPT: Measured Primary Vac and Iac for all links', 'FontSize', 10);
%pwr_int = 1/ti(end)*integral(Iac_sch.*vac_sch, ti(1), ti(end))

%% save WPT voltages 
set(f1,'Units','Inches');
pos = get(f1,'Position');
set(f1,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);
print(f1, 'wpt_all_pri_VI.pdf', '-dpdf');
movefile('wpt_all_pri_VI.pdf','../../img/meas/wpt_all_pri_VI.pdf');