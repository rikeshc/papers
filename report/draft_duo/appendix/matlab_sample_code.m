clear all;
addpath(genpath('/hom/mes/src/matlab/gpib/linux'));

%% Parameter  declaration and initailisation
Voffset1 = 0;
Vamp1    = 3;           % Vpp in function generator
Freq1    = 13.56*10^6;
Vlimit   = 5;           % device range 2V-200V
Ilimit   = 20*10^-3;    % device range 20pA-20mA
mode     = 'I';
pause(1);

%% Instruments GPIB address
TTI1244_address = 6;    % Arbitary function generator
HP54622_address = 24;   % Oscilloscope
K6514_address   = 18;   % Electrometer DMM
HPE3631_address = 8;    % Power supply

%% Power supply initailisation and setup
HPE3631Init(HPE3631_address);
HPE3631_SetILimit(1, 0.05);
HPE3631_SetILimit(2, 0.05);
HPE3631_SetVolt(1, 4);	% To regulator on PCB "Vsup"
HPE3631_SetVolt(2, 0);	
HPE3631_Operate();
pause(1);


%% Function generator initailisation and setup
TTi1244_Init(TTI1244_add);	
TTi1244_SetChannel(1);	% Channel 1 as "Vac"
TTi1244_SetTerm('50');
TTi1244_SetWaveform('SINUS');
TTi1244_SetAmplitude(Vamp1);
TTi1244_SetFrequency(Freq1);
TTi1244_DCoffset(Voffset1);
TTi1244_ChannelEnable('ON', 1);
pause(1);

%%  Multimeter initailisation and setup
GPIB_Write('*CLS;*RST;', K6514_add);
K6514_SetMode(mode);
K6514_SetRange(Ilimit);
pause(1);
%K6514_QuickMeasure();  

%% Oscilloscope initailisation and setup
GPIB_Write('*CLS;*RST;', HP54622_add); 
%HP54622_AutoScale(1);  % autoscaling channel 1
HP54622_SetVerticalRange(1, 3, 0);  % voltage scale
HP54622_SetTimeScale(2*1/Freq1);    % time scale
pause(1);
[time, data] = GetData(HP54622_DefaultAdr);	% read all channles
Vrec_freq = HP54622_MeasFreq(3);	% Vrec ripple freq
Vreg_freq = HP54622_MeasFreq(4);	% Vreg ripple freq
pause(1);

Vin1 = data(:, 1);	Vin1_vpp = peak2peak(Vin1);		% Channel 1 as "Vin1"
Vin2 = data(:, 2);	Vin2_vpp = peak2peak(Vin2);		% Channel 2 as "Vin2"
Vrec = data(:, 3);  Vrec_avg = mean(Vrec);		% channle 3 as "Vrec"
Vrec_rip = peak2peak(Vrec);
Vreg = data(:, 4);  Vreg_avg = mean(Vreg);		% channle 4 as "Vreg"
Vreg_rip = peak2peak(Vreg);
Vin  = Vin1 - Vin2;	Vin_vpp = peak2peak(Vin)/2;	% "Vin"
time  = time * 10^9 + 250;	% in ns and starting with 0 ns

%% Plotting all voltage waveforms
f1 = figure(1);
plot(time, Vin1 ,'r', time, Vin2 ,'b', time, Vrec ,'g', time, Vreg ,'m'); hold on;
plot(time, Vin); hold off;
xlim = ([0, 500]);
xlabel('Time, ns');
ylabel('Voltages, V');
grid on;

vin1_legend = sprintf('Vin1: V_{pp} = %.3f V', Vin1_vpp);
vin2_legend = sprintf('Vin2: V_{pp} = %.3f V', Vin2_vpp);
vrec_legend = sprintf('Vrec: V_{pp} = %.3f V, V_{avg} = %.3f V', Vrec_rip, Vrec_avg);
vreg_legend = sprintf('Vreg: V_{pp} = %.3f V, V_{avg} = %.3f V', Vreg_rip, Vreg_avg);
vin_legend  = sprintf('Vin : V_{pp} = %.3f V', Vin_vpp);
legend(vin1_legend, vin2_legend, vrec_legend, vreg_leg, vin_legend', 'location', 'best');
title('PMS: Measured voltages', 'FontSize', 10);

%% save plot the plot
set(f1,'Units','Inches');
pos = get(f1,'Position');
set(f1,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);
print(f1, 'pms_all_vs.pdf', '-dpdf');
movefile('pms_all_vs.pdf','../../../img/meas/pms_all_vs.pdf');
