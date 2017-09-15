
clear all;
addpath(genpath('/hom/mes/src/matlab/gpib/linux'));

%% Device Initialization: OSCILLOSCOPE, Aligent 54624A
HP54622_add = 24;
GPIB_Write('*CLS;*RST;', HP54622_add); 
pause(0.5);
% measurement setup
HP54622_AutoScale(1);                % autoscaling channel 1
%HP54622_SetVerticalRange(1, 3, 0);  % voltage for complete window, not div, 
%HP54622_SetTimeScale(2*1/Freq1);    % time for complete window, now a div
pause(0.5);

%% First take loaded Vac
clear data time;
[time, data] =GetData(HP54622_DefaultAdr);
pause(0.5);
V_loaded = data(:, 3);
Vin1 = data(:, 1);
Vin2 = data(:, 2);
time = time * 10^9; 
clear data;

%% Then take unloaded Vac
clear data time;
[time, data] =GetData(HP54622_DefaultAdr);
pause(0.5);
V_unloaded = data(:, 3);
time = time * 10^9;     % in ns
clear data;

%% Calculation of Iac

V_drop = V_unloaded - V_loaded;
Vac = 3.82;
Vrms = Vac/sqrt(2);
R_load = 50;    % complete DUT as resisitve load
Iac_source = V_drop/R_load*1000; %mA
Irms = rms(Iac_source);
Psource = Irms * Vrms;
Prs = R_load * Irms^2/1000;
Pin = Psource - Prs;

%%

save('current_10ma');
%% Plot voltages 
f10 = figure(10);
plot(time, V_loaded ,'r', time, V_unloaded ,'b', time, V_drop ,'g'); 

xlabel('Time, ns');
ylabel('Voltage, V');
grid on;

legend('loaded Vin', 'unloaded Vin', 'DUT drop', 'location', 'best');
title('Inputs voltages', 'FontSize', 10);

%% Plot ac current 
f12 = figure(12);
plot(time, Iac_source); 

xlabel('Time, ns');
ylabel('current, mA');
grid on;

legend('current Iac', 'location', 'best');
title('Current drawn', 'FontSize', 10);

%%
clear all;
load('current_10ma');
a1 = load('load_10mA');
time = time+100;
leg1 = sprintf('Vrec: Avg = %.3f V', a1.Vrec_avg);
leg2 = sprintf('Isrc: Rms = %.3f mA', Irms);

f1 = figure(1);
subplot(2, 1, 1);
plot(time, Vin1, time, Vin2, time, a1.Vrec);
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
%% save plot
set(f1,'Units','Inches');
pos = get(f1,'Position');
set(f1,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);
print(f1, 'current_10mA.pdf', '-dpdf');
movefile('current_10mA.pdf','../../../../img/meas/current_10mA.pdf');
