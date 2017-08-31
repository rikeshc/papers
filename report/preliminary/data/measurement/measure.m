% Instruments may have different address in the instruments,
% here default address are used for convinence. Please change instrument
% local addresses to these default values

clear all;
addpath(genpath('/hom/mes/src/matlab/gpib/linux'));

%% Parameter values
Voffset1 = 0;
Vamp1    = 2.9;           % Vpp
Freq1    = 13.56*10^6;

Vlimit   = 5;           % device range 2V-200V
Ilimit   = 20*10^-3;    % device range 20pA-20mA
mode     = 'V';
pause(0.5);

%% Instruments address
TTI1244_add = 6;        % Arbitary function generator
HP54622_add = 24;       % Oscilloscope
K6514_add   = 18;       % Electrometer DMM
E3631A_add  = 5;        % Power supply

%% Device initailisation: FUNCTION GENERATOR, TTi TGA 1244
TTi1244_Init(TTI1244_add);        % AWFG address is 6, check in the instrument
pause(0.5);

%% Channel 1 setup
TTi1244_SetChannel(1);
TTi1244_SetTerm('50');
TTi1244_SetWaveform('SINUS');
TTi1244_SetAmplitude(Vamp1);
TTi1244_SetFrequency(Freq1);
TTi1244_DCoffset(Voffset1);
pause(0.5);
TTi1244_ChannelEnable('ON', 1);
%TTi1244_ChannelEnable('OFF', 1);
pause(0.5);

%% Channel 2 setup
TTi1244_SetChannel(2);
TTi1244_SetTerm('50');
TTi1244_SetWaveform('SINUS');
TTi1244_SetAmplitude(Vamp1);
TTi1244_SetFrequency(Freq1);
TTi1244_DCoffset(Voffset1);
TTi1244_ChannelEnable('ON', 2);
%TTi1244_ChannelEnable('OFF', 2);
pause(0.5);

%% Device Initialization: ELECTROMETER, Keithley 6514
 
GPIB_Write('*CLS;*RST;', K6514_add);
pause(0.5);

% Measurements setup
K6514_SetMode(mode);
K6514_SetRange(Vlimit);
%K6514_SetMode(mode);
%K6514_SetRange(Ilimit);
pause(0.5);
K6514_QuickMeasure();   % Take measurements

%% Device Initialization: OSCILLOSCOPE, Aligent 54624A

GPIB_Write('*CLS;*RST;', HP54622_add); 
pause(0.5);

% measurement setup
HP54622_AutoScale(1);                % autoscaling channel 1
%HP54622_SetVerticalRange(1, 3, 0);  % voltage for complete window, not div, 
%HP54622_SetTimeScale(2*1/Freq1);    % time for complete window, now a div
pause(0.5);
%%
%[time, data] = HP54622_GetData(HP54622_DefaultAdr);
[time, data] =GetData(HP54622_DefaultAdr);

Vin1 = data(:, 1);

Vin2 = data(:, 2);
Vrec = data(:, 3);
Vin = data(:, 1)-data(:, 2);

time = time * 10^9;     % in ns
%% plot

f1 = figure;
plot(time, Vin1 ,'r', time, Vin2 ,'b', time, Vrec ,'g'); 
hold on;
plot(time, Vin); hold off;
xlabel('Time, s');
ylabel('Voltage, V');
grid on;

ch1 = sprintf('CH1: V_{pp} = %.3f V, F = %2.2f MHz', HP54622_MeasVpp(1), HP54622_MeasFreq(1)/10^6);
ch2 = sprintf('CH2: V_{pp} = %.3f V, F = %2.2f MHz', HP54622_MeasVpp(2), HP54622_MeasFreq(2)/10^6);
ch3 = sprintf('CH3: V_{pp} = %.3f V, V_{avg} = %.3f V', HP54622_MeasVpp(3), mean(data(:,3)));
vin_leg = sprintf('CH3: V_{in} = %.3f V', peak2peak(Vin)/2);

legend(ch1, ch2, ch3, vin_leg, 'location', 'best');

%HP54622_MeasVpp(1);
%HP54622_MeasFreq (1)