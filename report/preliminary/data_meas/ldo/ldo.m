%% LDO Vin sweep, currents and load sweep

Vin = [0, 0.5, 1, 1.5, 1.6, 1.7, 1.8, 1.9, 2.0, 2.1, 2.2, 2.3, 2.4, 2.5, 2.6, 2.7, 2.8, 2.9];
Vreg = [0, 0, 0, 0, 0, 0, 0.02, 0.06, 1.02, 1.33, 1.52, 1.66, 1.76, 1.79, 1.805, 1.8, 1.79, 1.795];
Iin = [68*10^-6, 100*10^-6, 0.00036, 0.00164, 0.00198, 0.00236, 0.00275, 0.00315, 0.00513, 0.00645, 0.00756, 0.00847, 0.0089, 0.00891, 0.00883, 0.00857, 0.0085, 0.0086]*1000;
Ileak = [0.26, 0.27, 0.62, 1.84, 2.17, 2.52, 2.85, 3.13, 2.55, 2.95, 3.48, 4, 4.23, 4.14, 3.96, 3.74, 3.69, 3.55];

%% Vreg plot Vin sweep for Iload of 5 mA
f1 = figure(1);
load('vreg_pex.mat');
plot(Vin, Vreg, '*-.'); hold on;
plot(Vin_pex, Vreg_pex); hold off;
grid on;
xlabel('V_{in}(V)'); 
ylabel('V_{reg}(V)');
title('LDO: Vin sweep @5 mA load', 'FontSize', 10)
legend('MEAS: V_{reg}', 'SIM: V_{reg}','location', 'best');

%% current consumed and leaked
f2 = figure(2);
load('current_pex.mat');
plot(Vin, Iin, '*-.', Vin, Ileak, '+-.'); hold on;
plot(Vin_pex, Iin_pex*1000, Vin_pex, Ileak_pex*1000); hold off;
grid on;
ylabel('I_{load} (mA)'); 
xlabel('V_{in}(V)');
title('LDO: Measured current consumption', 'FontSize', 10)
legend('MEAS: I_{source}', 'MEAS: I_{quiescent}', 'SIM: I_{source}', 'SIM: I_{quiescent}', 'location', 'best');


%% Vreg vs Iload sweep
clear all;
load('iload_sweep_pex.mat');
load('iload_sweep_isrc_pex.mat');

Iload = linspace(0, 11, 12);
Vreg = [1.816, 1.810, 1.806, 1.800, 1.791, 1.781, 1.773, 1.762, 1.752, 1.744, 1.73, 1.725];
Isrc = [3.25, 4.92, 6.05, 7.13, 8.18, 9.22, 10.12, 11.09, 12.07, 13.04, 13.76, 14.94]; % mA

f3 = figure(3);
 yyaxis left;
plot(Iload, Vreg, '*-.', Iload_pex*1000, Vreg_pex); hold on; 
ylabel('V_{reg}(V)');
        yyaxis right
        plot(Iload, Isrc, '+-.', Iload_pex*1000, Isrc_pex*1000);
hold off;
grid on;
xlabel('I_{load}(mA)'); 
ylabel('I_{source}(mA)');
title('LDO: I_{load} sweep @ Vin = 2.45 V', 'FontSize', 10)
legend('MEAS: V_{reg}', 'SIM: V_{reg}', 'MEAS: I_{src}','SIM: V_{reg}', 'SIM: I_{src}', 'location', 'best');


%% save Vin sweep
set(f1,'Units','Inches');
pos = get(f1,'Position');
set(f1,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);
print(f1, 'ldo_vin_sweep.pdf', '-dpdf');
movefile('ldo_vin_sweep.pdf','../../img/meas/ldo_vin_sweep.pdf');

%% save currents
set(f2,'Units','Inches');
pos = get(f2,'Position');
set(f2,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);
print(f2, 'ldo_current.pdf', '-dpdf');
movefile('ldo_current.pdf','../../img/meas/ldo_current.pdf');

%% save Iload sweep
set(f3,'Units','Inches');
pos = get(f3,'Position');
set(f3,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);
print(f3, 'ldo_iload_sweep.pdf', '-dpdf');
movefile('ldo_iload_sweep.pdf','../../img/meas/ldo_iload_sweep.pdf');