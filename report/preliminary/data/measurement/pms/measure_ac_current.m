
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
V_loaded = data(:, 4);
clear data;

%% Then take loaded Vac
clear data time;
[time, data] =GetData(HP54622_DefaultAdr);
pause(0.5);
V_unloaded = data(:, 4);

%% Calculation of Iac

V_drop = V_unloaded - V_loaded;
time = time * 10^9;     % in ns
R_load = 200;    % complete DUT as resisitve load
Iac_source = V_drop/R_load*1000; %mA


%% clear data time;
[time, data] =GetData(HP54622_DefaultAdr);
pause(0.5);
%%
V_drop = data(:, 1) - data(:, 2);
V_loaded = data(:, 1);
V_unloaded = data(:, 2);
pause(0.5);

Iac_source = V_drop/2*1000; %mA

%% Plot voltages 
f1 = figure;
plot(time, V_loaded ,'r', time, V_unloaded ,'b', time, V_drop ,'g'); 

xlabel('Time, ns');
ylabel('Voltage, V');
grid on;

legend('loaded Vin', 'unloaded Vin', 'DUT drop', 'location', 'best');
title('Inputs voltages', 'FontSize', 10);

%% Plot ac current 
f1 = figure;
plot(time, Iac_source); 

xlabel('Time, ns');
ylabel('current, mA');
grid on;

legend('current Iac', 'location', 'best');
title('Current drawn', 'FontSize', 10);