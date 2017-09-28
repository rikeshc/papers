
%% 10 ma load VIN and Vout comparision
clear all;
vin2 = importdata('C4vin2_10ma00000.dat');
vin1 = importdata('C1vin1_10ma00000.dat');
vrec = importdata('C1vrec_10ma00000.dat');
vin = importdata('F1vin_10ma00000.dat');

time = vrec(:,1)*10^9+100+10.5; % time in ns
Vrec_off = 0.024;

load('/uio/hume/student-u18/rikeshc/Rikesh/mast/papers/report/preliminary/data/pms_2/Vs_pex.mat');

%time_pex = (t_pex-t_pex(1))*10^9 - 54;
time_pex = (t_pex-t_pex(1))*10^9 - 73.5;

f1 = figure(1);
h1 = plot(time, vin1(:,2) ,'r', time, vin2(:,2) ,'b', time, vrec(:,2) + Vrec_off ,'g'); 
hold on;
plot(time, vin(:,2), 'm'); 

%h2 = plot(time_pex, V1_pex, 'r--', time_pex, V2_pex, 'b--', time_pex, Vrec_pex ,'g--');
h2 = plot(time_pex, Vin1_pex, 'r--', time_pex, Vin2_pex, 'b--', time_pex, Vrec_pex ,'g--');
plot(time_pex,(Vin1_pex-Vin2_pex), 'm--'); 
%plot(Na, NaN,'b', time, NaN, 'b--');
hold off;
xlim([68, 159]);
%xlim([28, 115]);
ylim([-3.2, 3.2]);
lvreg_s = sprintf('Vrec: SIM, %.3f V', mean(Vrec_pex)+0.017);
lvreg_m = sprintf('Vrec: MEAS, %.3f V', mean(vrec(:,2))+Vrec_off);

xlabel('Time, ns');
ylabel('Voltage, V');
grid on;
title('Rectifier: Measured vs Simulated @10 mA load', 'FontSize', 10);
legend('Vin1: MEAS', 'Vin2: MEAS', lvreg_m, 'Vin: MEAS', 'Vin1: SIM', 'Vin2: SIM', lvreg_s, 'Vin: SIM' , 'location', 'best');
%%
load('/uio/hume/student-u18/rikeshc/Rikesh/mast/papers/report/preliminary/data/pms_2/PI_pex.mat');
%timep = (t_pex-t_pex(1))*10^9-54;

vac_drop = importdata('F2vdrop_10ma00000.dat');
vac = importdata('C1vac_10ma00000.dat');


Iac = vac_drop(:,2)/5.05*1000;
%time = vac_drop(:,1)*10^9+212.6; % time in ns
%timep = (t_pex-t_pex(1))*10^9+15.5;

f3 = figure(3);
yyaxis left
plot(time, vac(:,2), time_pex, Vac_pex); 
yyaxis right
plot(time, Iac, time_pex, Iac_pex*1000); 
%plot(time, (vac_pex-(-Iac_pex*50))/0.7, 'r--', timep,  -Iac_pex*1000, 'r')
hold off;
xlim([68, 159]);
xlabel('Time, ns');
ylabel('Current, mA');
grid on;

%% save plot 10 ma load

set(f1,'Units','Inches');
pos = get(f1,'Position');
set(f1,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);
print(f1, 'rect_10ma.pdf', '-dpdf');
movefile('rect_10ma.pdf','../../img/meas/rect_10ma.pdf');

%%
clear all;
load('/uio/hume/student-u18/rikeshc/Rikesh/mast/papers/report/preliminary/data/pms_2/Vs_pex.mat');
load('/uio/hume/student-u18/rikeshc/Rikesh/mast/papers/report/preliminary/data/pms_2/PI_pex.mat');
vac_meas = importdata('C1vac_10ma00000.dat');
vin = importdata('F1vin_10ma00000.dat');

%vac = vac_meas(:,2);
vac = vin(:,2);
time = vac_meas(:,1);
vac_drop = importdata('F2vdrop_10ma00000.dat');
Iac = vac_drop(:,2)/5.*1000;
plot(time, vac.*Iac)
%plot(t_pex, Vac_pex.*Iac_pex)

%P_total2 = 1/(t_pex(end)-t_pex(1))*(Vin1_pex.*Ivin1_pex) + (Vin2_pex.*Ivin2_pex))
P_total_pms  =  1/(t_pex(end)-t_pex(1)) * trapz(t_pex, abs(Vac_pex.*Iac_pex))
P_total_meas =  1/(time(end)-time(1))   * trapz(time, abs(vac.*Iac))
