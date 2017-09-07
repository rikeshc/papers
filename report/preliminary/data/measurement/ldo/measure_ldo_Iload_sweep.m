clear all;
addpath(genpath('/hom/mes/src/matlab/gpib/linux'));

%% Power supply
HPE3631Init(HPE3631_DefaultAdr);
HPE3631_SetILimit(1, 0.05);
HPE3631_SetILimit(2, 0.05);
HPE3631_SetVolt(1, 2.4);
HPE3631_SetVolt(2, 4);
pause(1);

HPE3631_Operate(5);

%%
GPIB_Write('*CLS;*RST;', HP54622_DefaultAdr); 
pause(0.5);

% measurement setup
HP54622_AutoScale(1);                % autoscaling channel 1
%HP54622_SetVerticalRange(1, 3, 0);  % voltage for complete window, not div, 
%HP54622_SetTimeScale(2*1/Freq1);    % time for complete window, now a div
pause(0.5);

%%
clear all;
[time, data] =GetData(HP54622_DefaultAdr);

pause(1);
Vreg_vpp = HP54622_MeasVpp(1);          %ripple in Vreg
F_Vreg   = HP54622_MeasFreq(1)/10^6;    %frequency of Vreg ripple
Vreg_avg = MeasAvg(4);
pause(1);
Vrec = data(:, 3);
Vreg = data(:, 4);
time = time * 10^3;     % in ms

%%
clear data; 
save('ldo_12mA');

%%
f1 = figure;
plot(time, Vreg); 
hold on;


xlabel('Time, ms');
ylabel('Voltage, V');
grid on;
leg1 = sprintf('V_{reg} = %.3f V,  Del V = %.3f, F = %2.2f MHz',Vreg_avg, Vreg_vpp, F_Vreg);
legend(leg1,  'location', 'best');
title('LDO:V_{reg}', 'FontSize', 10);
