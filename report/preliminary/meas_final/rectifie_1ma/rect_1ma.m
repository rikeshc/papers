
%% 1 ma load VIN and Vout comparision
clear all;
vin2 = importdata('C4vin2_10ma00000.dat');
vin1 = importdata('C1vin1_10ma00000.dat');
vrec = importdata('C1vrec_10ma00000.dat');
vin = importdata('F1vin_10ma00000.dat');
time = vrec(:,1)*10^9+250; % time in ns
vrec_off = 0.039;

load('pex_1ma.mat');
%time_pex = (t_pex-t_pex(1))*10^9 - 54;
time_pex = (t_pex-t_pex(1))*10^9+23;

f1 = figure(1);
h1 = plot(time, vin1(:,2) ,'r', time, vin2(:,2) ,'b', time, vrec(:,2)+vrec_off ,'g'); 
hold on;
plot(time, vin(:,2), 'm'); 

%h2 = plot(time_pex, V1_pex, 'r--', time_pex, V2_pex, 'b--', time_pex, Vrec_pex ,'g--');
h2 = plot(time_pex, Vin1_pex, 'r--', time_pex, Vin2_pex, 'b--', time_pex, Vrec_pex ,'g--');
plot(time_pex,(Vin1_pex-Vin2_pex), 'm--'); 
%plot(Na, NaN,'b', time, NaN, 'b--');
hold off;
xlim([64, 150]);
%xlim([28, 115]);
ylim([-3.2, 3.2]);
lvreg_s = sprintf('Vrec: SIM, %.3f V', mean(Vrec_pex));
lvreg_m = sprintf('Vrec: MEAS, %.3f V', mean(vrec(:,2))+vrec_off);

xlabel('Time, ns');
ylabel('Voltage, V');
grid on;
title('Rectifier: Measured vs Simulated @1 mA load', 'FontSize', 10);
legend('Vin1: MEAS', 'Vin2: MEAS', lvreg_m, 'Vin: MEAS', 'Vin1: SIM', 'Vin2: SIM', lvreg_s, 'Vin: SIM' , 'location', 'best');
%%

load('pex_1ma_current.mat');
timep = (t_pex-t_pex(1))*10^9-95;

vac_drop = importdata('F2vin_drop_1ma00000.dat');

Iac = vac_drop(:,2)/5.05*1000;
%time = vac_drop(:,1)*10^9+212.6; % time in ns
%timep = (t_pex-t_pex(1))*10^9+15.5;

f3 = figure(3);

plot(time, Iac, timep, Iac_pex*1000); 
%plot(time, (vac_pex-(-Iac_pex*50))/0.7, 'r--', timep,  -Iac_pex*1000, 'r')
hold off;
xlim([64, 150]);
xlabel('Time, ns');
ylabel('Current, mA');
grid on;


%% save plot 1 ma load
set(f1,'Units','Inches');
pos = get(f1,'Position');
set(f1,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);
print(f1, 'rect_1ma.pdf', '-dpdf');
movefile('rect_1ma.pdf','../../img/meas/rect_1ma.pdf');

