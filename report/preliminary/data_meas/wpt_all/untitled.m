%% 1 ma load VIN and Vout comparision
clear all;
vin2 = importdata('C4vin2_10ma00000.dat');
vin1 = importdata('C1vin1_10ma00000.dat');
vrec = importdata('C1vrec_10ma00000.dat');
vin = importdata('F1vin_10ma00000.dat');
time = vrec(:,1)*10^9+100+7.8; % time in ns
load('pex_1ma.mat');

%time_pex = (t_pex-t_pex(1))*10^9 - 54;
time_pex = (t_pex-t_pex(1))*10^9+28.5;

f3 = figure(3);
h1 = plot(time, vin1(:,2) ,'r', time, vin2(:,2) ,'b', time, vrec(:,2) ,'g'); 
hold on;
plot(time, vin(:,2), 'm'); 

%h2 = plot(time_pex, V1_pex, 'r--', time_pex, V2_pex, 'b--', time_pex, Vrec_pex ,'g--');
h2 = plot(time_pex, Vin1_pex, 'r--', time_pex, Vin2_pex, 'b--', time_pex, Vrec_pex ,'g--');
plot(time_pex,(Vin1_pex-Vin2_pex), 'm--'); 
%plot(Na, NaN,'b', time, NaN, 'b--');
hold off;
xlim([68, 159]);
ylim([-3.1, 3.1]);
lvreg_s = sprintf('Vrec: SIM, %.3f V', mean(Vrec_pex));
lvreg_m = sprintf('Vrec: MEAS, %.3f V', mean(vrec(:,2)));

xlabel('Time, ns');
ylabel('Voltage, V');
grid on;
title('Rectifier: Measured vs Simulated', 'FontSize', 10);
legend('Vin1: MEAS', 'Vin2: MEAS', lvreg_m, 'Vin: MEAS', 'Vin1: SIM', 'Vin2: SIM', lvreg_s, 'Vin: SIM' , 'location', 'best');
