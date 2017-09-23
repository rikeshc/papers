clear all;
vrec = importdata('C1vrec_wpt10ma00000.dat');
vin1 = importdata('C1vin1_wpt10ma00000.dat');
vin2 = importdata('C4vin2_wpt10ma00000.dat');
vin = importdata('F1vin_wpt10ma00000.dat');

vrec_add = 0.037;

load('/uio/hume/student-u18/rikeshc/Rikesh/mast/papers/report/preliminary/data/wpt/Vs_pex.mat');
time = vrec(:,1)*10^9+250; % time in ns
timep = (t_pex-t_pex(1))*10^9-17;

f1 = figure(1);
h1 = plot(time, vin1(:,2), 'r', time, vin2(:,2), 'b', time, vin(:,2), 'm', time, vrec(:,2)+vrec_add, 'g'); hold on;
h2 = plot(timep, vin1_pex, 'r-.', timep, vin2_pex, 'b-.', timep, (vin1_pex-vin2_pex), 'm-.', timep, vrec_pex, 'g-.'); hold off;
grid on;
%ylim([1.5, 2.7]);
%rec = sprintf('V_{rec} = %.3f V, \DELTA = %.0f mV', mean(vrec(:,2)), peak2peak(vrec(:,2))*1000);
rec = sprintf('MEAS: V_{rec} = %.3f V,', mean(vrec(:,2))+vrec_add);
rip = sprintf('V_{rec} = %.0f mV',  peak2peak(vrec(:,2))*1000);
recp = sprintf('SIM: V_{rec} = %.3f V,', mean(vrec_pex));
ripp = sprintf('V_{rec} = %.0f mV',  max((vrec_pex)-min(vrec_pex))*1000);


xlim([63, 221]);
ylim([-5, 3]);
xlabel('Time, ns');
ylabel('Voltages, V');

legend('MEAS: V_{in1}', 'MEAS: V_{in2}', 'MEAS: V_{in}', strcat(rec,' \Delta', rip), 'SIM: V_{in1}', 'SIM: V_{in2}', 'SIM: V_{in}', strcat(recp,' \Delta', ripp), 'location', 'best');
%legend([h1(1), h2(1)], 'Blue Meanies', 'Red Rovers')
title('WPT: Measured voltages', 'FontSize', 10);


%% Primary current and voltages
load('/uio/hume/student-u18/rikeshc/Rikesh/mast/papers/report/preliminary/data/wpt/PI_pex.mat');
timep = (t_pex-t_pex(1))*10^9-54;

vpri = importdata('C1vpri_wpt10ma00000.dat');
vac_drop = importdata('F2vprim_drop_wpt10ma00000.dat');

Iac = vac_drop(:,2)/5*1000;
time = vpri(:,1)*10^9+212.6; % time in ns
timep = (t_pex-t_pex(1))*10^9+15.5;

f3 = figure(3);
yyaxis left;
plot(time, vpri(:,2), timep, vpri_pex); hold on;
ylabel('Voltage, V');
yyaxis right;
plot(time, Iac, timep, Iac_pex*1000); 
%plot(time, (vac_pex-(-Iac_pex*50))/0.7, 'r--', timep,  -Iac_pex*1000, 'r')

hold off;
xlim([85, 242]);
xlabel('Time, ns');
ylabel('Current, mA');
grid on;

legend('MEAS: V_{primary}', 'SIM: V_{primary}', 'MEAS: I_{primary}', 'SIM: I_{primary}', 'location', 'best');
title('WPT: Primary voltage and current', 'FontSize', 10);

%%
pwr_sim = mean(vpri_pex.*Iac_pex)*1000
pwr_sim_2 = rms(vpri_pex)*rms(Iac_pex)*1000
pwr_meas = mean(vpri(:,2).*Iac)
pwr_meas_2 = rms(vpri(:,2))*rms(Iac)

%% save WPT voltages 
set(f1,'Units','Inches');
pos = get(f1,'Position');
set(f1,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);
print(f1, 'wpt5_vs.pdf', '-dpdf');
movefile('wpt5_vs.pdf','../../../img/meas/wpt5_vs.pdf');

%% save WPT current
set(f3,'Units','Inches');
pos = get(f3,'Position');
set(f3,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);
print(f3, 'wpt5_current_pri.pdf', '-dpdf');
movefile('wpt5_current_pri.pdf','../../img/meas/wpt5_current_pri_2.pdf');

%%
ti = time - time(1);
pwr_trapz = 1/ti(end)*trapz(ti, Iac.*vpri(:,2));
%pwr_int = 1/ti(end)*integral(Iac_sch.*vac_sch, ti(1), ti(end))

%%
plot(time, Iac)
