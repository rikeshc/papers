clear all;
addpath(genpath('/hom/mes/src/matlab/gpib/linux'));

Vrec = linspace(1.5, 3, 31);
Vreg = zeros(size(Vrec));

%% Power supply
HPE3631Init(HPE3631_DefaultAdr);
HPE3631_SetILimit(1, 0.05);
HPE3631_SetILimit(2, 0.05);
HPE3631_SetVolt(1,0);
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
for i = 1:length(Vrec)
    HPE3631_SetVolt(1, Vrec(i));
    pause(5);
    Vreg(i) = MeasAvg(4);
    pause(2);
    
end
%%
save('ldo_Vrec_sweep');

%%
load('ldo_Vrec_sweep.mat');

f1 = figure;
plot(Vrec, Vreg); 
hold on;


xlabel('V_{in}, V');
ylabel('V_{reg}(V)');
grid on;
%leg1 = sprintf('V_{reg} = %.3f V,  Del V = %.3f, F = %2.2f MHz',Vreg_avg, Vreg_vpp, F_Vreg);
%legend(,  'location', 'best');
title('LDO Vin sweep', 'FontSize', 10);
