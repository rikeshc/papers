clear all;
unloaded = importdata('M1loaded_10ma00000.dat');
loaded = importdata('M2unloaded_10ma00000.dat');

time = unloaded(:,1)*10^9+500; % time in ns
%

V_drop = unloaded(:,2) - loaded(:,2);
Vac = 4;
Vrms = Vac/sqrt(2);
R_load = 50;    % complete DUT as resisitve load
Iac_source = V_drop/R_load*1000; %mA
Irms = rms(Iac_source);
Psource = Irms * Vrms;
Prs = R_load * Irms^2/1000;
Pin = Psource - Prs;


%% Plot voltages 
f10 = figure(10);
plot(time, loaded(:,2) ,'r', time, unloaded(:,2) ,'b', time, V_drop ,'g'); 

xlabel('Time, ns');
ylabel('Voltage, V');
grid on;

legend('loaded Vin', 'unloaded Vin', 'DUT drop', 'location', 'best');
title('Inputs voltages', 'FontSize', 10);

%% Plot ac current and voltage
f12 = figure(12);
plot(time, Iac_source); 

xlabel('Time, ns');
ylabel('current, mA');
grid on;

legend('current Iac', 'location', 'best');
title('Current drawn', 'FontSize', 10);

%%
%clear all;
vin2 = importdata('../all_loads/C4vin2_10m00000.dat');
vin1 = importdata('../all_loads/M1vin1_10m00000.dat');
vrec = importdata('../all_loads/C1vrec_10m00000.dat');
vin = importdata('../all_loads/M2vin_10m00000.dat');

time_v = vrec(:,1)*10^9+250; 

leg1 = sprintf('Vrec: Avg = %.3f V', mean(vrec(:,2)));
leg2 = sprintf('Isrc: Rms = %.3f mA', Irms);

%%
f1 = figure(1);
subplot(2, 1, 1);
plot(time_v, vin1(:,2), time_v, vin2(:,2), time_v, vrec(:,2));
grid on;
xlim([0, 160]);
legend('Vin1', 'Vin2', leg1,  'location', 'best');
ylabel('Voltage, V');
title('Source current for 10 mA load', 'FontSize', 10);

subplot(2, 1, 2);
plot(time, Iac_source);
grid on;
xlim([0, 160]);
legend(leg2, 'best');
xlabel('Time, ns');
ylabel('current, mA');
%%
set(f1,'Units','Inches');
pos = get(f1,'Position');
set(f1,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);
print(f1, 'rect_10ma.pdf', '-dpdf');
movefile('rect_10ma.pdf','../../../img/meas/rect_10ma_current.pdf');