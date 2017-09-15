%% Comparision for 10 mA measured and simulated

clear all;
vrec0 = importdata('C1vrec_0m00000.dat');
vrec1 = importdata('C1vrec_1m00000.dat');
vrec2 = importdata('C1vrec_2m00000.dat');
vrec4 = importdata('C1vrec_4m00000.dat');
vrec6 = importdata('C1vrec_6m00000.dat');
vrec8 = importdata('C1vrec_8m00000.dat');
vrec10 = importdata('C1vrec_10m00000.dat');

tm = vrec0(:,1)*10^9+250; % time in ns

%% ALL LOAD PLOTS
f2 = figure(2);
plot(tm, vrec1(:,2), tm, vrec2(:,2), tm, vrec4(:,2), tm, vrec6(:,2), tm, vrec8(:,2), tm, vrec10(:,2))
grid on;
ylim([1.5, 2.7]);
xlim([0, 500]);
xlabel('Time, ns');
ylabel('Vrec, V');

lrec1 = sprintf('1 mA load: V_{rec} = %.3f V, Ripple = %.0f mV', mean(vrec1(:,2)), peak2peak(vrec1(:,2))*1000);
lrec2 = sprintf('2 mA load: V_{rec} = %.3f V, Ripple = %.0f mV', mean(vrec2(:,2)), peak2peak(vrec2(:,2))*1000);
lrec4 = sprintf('4 mA load: V_{rec} = %.3f V, Ripple = %.0f mV', mean(vrec4(:,2)), peak2peak(vrec4(:,2))*1000);
lrec6 = sprintf('6 mA load: V_{rec} = %.3f V, Ripple = %.0f mV', mean(vrec6(:,2)), peak2peak(vrec6(:,2))*1000);
lrec8 = sprintf('8 mA load: V_{rec} = %.3f V, Ripple = %.0f mV', mean(vrec8(:,2)), peak2peak(vrec8(:,2))*1000);
lrec10 = sprintf('10 mA load: V_{rec} = %.3f V, Ripple = %.0f mV', mean(vrec10(:,2)), peak2peak(vrec10(:,2))*1000);

legend(lrec1, lrec2, lrec4, lrec6, lrec8, lrec10, 'location', 'best');
title('Rectifer: Measured Vrec for various load', 'FontSize', 10);

%%
%load('/uio/hume/student-u18/rikeshc/Rikesh/mast/papers/report/preliminary/data/rectifier_V_pex.mat');
clear all;
vin2 = importdata('C4vin2_10m00000.dat');
vin1 = importdata('M1vin1_10m00000.dat');
vrec = importdata('C1vrec_10m00000.dat');
vin = importdata('M2vin_10m00000.dat');
time = vrec(:,1)*10^9+257.5; % time in ns

load('/uio/hume/student-u18/rikeshc/Rikesh/mast/papers/report/preliminary/data/pms_2/Vs_pex.mat');

%time_pex = (t_pex-t_pex(1))*10^9 - 54;
time_pex = (t_pex-t_pex(1))*10^9 - 75;

f1 = figure(1);
h1 = plot(time, vin1(:,2) ,'r', time, vin2(:,2) ,'b', time, vrec(:,2) ,'g'); 
hold on;
plot(time, vin, 'm'); 

%h2 = plot(time_pex, V1_pex, 'r--', time_pex, V2_pex, 'b--', time_pex, Vrec_pex ,'g--');
h2 = plot(time_pex, Vin1_pex, 'r--', time_pex, Vin2_pex, 'b--', time_pex, Vrec_pex ,'g--');
plot(time_pex,(Vin1_pex-Vin2_pex), 'm--'); 
%plot(Na, NaN,'b', time, NaN, 'b--');
hold off;

xlim([28, 115]);
ylim([-3.2, 3.2]);

xlabel('Time, ns');
ylabel('Voltage, V');
grid on;
title('Rectifier: Measured vs Simulated', 'FontSize', 10);
legend('Vin1: MEAS', 'Vin2: MEAS', 'Vrec: MEAS', 'Vin: MEAS', 'Vin1: SIM', 'Vin2: SIM', 'Vrec: SIM', 'Vin: SIM' , 'location', 'best');

%% save plot
set(f1,'Units','Inches');
pos = get(f1,'Position');
set(f1,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);
print(f1, 'rect_10ma.pdf', '-dpdf');
movefile('rect_10ma.pdf','../../../img/meas/rect_10ma.pdf');


%% save plot
set(f2,'Units','Inches');
pos = get(f2,'Position');
set(f2,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);
print(f2, 'rect_load_sweep.pdf', '-dpdf');
movefile('rect_load_sweep.pdf','../../../img/meas/rect_load_sweep.pdf');

