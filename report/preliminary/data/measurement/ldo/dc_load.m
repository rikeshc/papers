clear all;

ma0 = load('ldo_0mA');
ma1 = load('ldo_1mA');
ma2 = load('ldo_2mA');
ma3 = load('ldo_3mA');
ma4 = load('ldo_4mA');
ma5 = load('ldo_5mA');
ma6 = load('ldo_6mA');
ma7 = load('ldo_7mA');
ma8 = load('ldo_8mA');
ma9 = load('ldo_9mA');
ma10 = load('ldo_10mA');
ma11 = load('ldo_11mA');
ma12 = load('ldo_12mA');
load('/uio/hume/student-u18/rikeshc/Rikesh/mast/papers/report/preliminary/data/ldo_Iload_pex.mat')

time = ma1.time+5;

Vreg = [ma0.Vreg_avg, ma1.Vreg_avg, ma2.Vreg_avg, ma3.Vreg_avg, ma4.Vreg_avg, ma5.Vreg_avg, ma6.Vreg_avg, ma7.Vreg_avg, ma8.Vreg_avg, ma9.Vreg_avg, ma10.Vreg_avg, ma11.Vreg_avg, ma12.Vreg_avg];

Iload = linspace(0, 12, 13);
Iload_pex = Iload_pex*1000;

%%
f1 = figure(1);
plot(Iload, Vreg, '*-.', Iload_pex, vreg_pex);
grid on;
ylim([1.6, 1.9]);
xlabel('I_{load} (mA)'); 
ylabel('V_{reg}(V)');
legend('Measured', 'Simulated', 'location', 'best');
title('Measured:LDO load sweep', 'FontSize', 10);

%% save plot
set(f1,'Units','Inches');
pos = get(f1,'Position');
set(f1,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);
print(f1, 'ldo_load_sweep.pdf', '-dpdf');
movefile('ldo_load_sweep.pdf','../../../img/meas/ldo_load_sweep.pdf');

%%
f2 = figure(2);
plot(time, ma1.Vreg, time, ma2.Vreg, time, ma3.Vreg, time, ma4.Vreg, time, ma5.Vreg); hold on;
plot(time, ma6.Vreg, time, ma7.Vreg, time, ma8.Vreg, time, ma9.Vreg, time, ma10.Vreg);hold off;
grid on;
vrec1 = sprintf('1 mA load: Vreg = %.3f V, Ripple = %.3f V', ma1.Vreg_avg, ma1.Vreg_vpp);
vrec2 = sprintf('2 mA load: Vreg = %.3f V, Ripple = %.3f V', ma2.Vreg_avg, ma2.Vreg_vpp);
vrec3 = sprintf('3 mA load: Vreg = %.3f V, Ripple = %.3f V', ma3.Vreg_avg, ma3.Vreg_vpp);
vrec4 = sprintf('4 mA load: Vreg = %.3f V, Ripple = %.3f V', ma4.Vreg_avg, ma4.Vreg_vpp);
vrec5 = sprintf('5 mA load: Vreg = %.3f V, Ripple = %.3f V', ma5.Vreg_avg, ma5.Vreg_vpp);
vrec6 = sprintf('6 mA load: Vreg = %.3f V, Ripple = %.3f V', ma6.Vreg_avg, ma6.Vreg_vpp);
vrec7 = sprintf('7 mA load: Vreg = %.3f V, Ripple = %.3f V', ma7.Vreg_avg, ma7.Vreg_vpp);
vrec8 = sprintf('8 mA load: Vreg = %.3f V, Ripple = %.3f V', ma8.Vreg_avg, ma8.Vreg_vpp);
vrec9 = sprintf('9 mA load: Vreg = %.3f V, Ripple = %.3f V', ma9.Vreg_avg, ma9.Vreg_vpp);
vrec10 = sprintf('10 mA load: Vreg = %.3f V, Ripple = %.3f V', ma10.Vreg_avg, ma10.Vreg_vpp);

xlabel('time (ms)'); 
ylabel('Vrec (V)');
ylim([1.5, 1.85]);
legend(vrec1, vrec2, vrec3, vrec4, vrec5,vrec6, vrec7, vrec8,vrec9, vrec10, 'location', 'best');
title('LDO: Measured Vreg for various load', 'FontSize', 10);
%%
set(f2,'Units','Inches');
pos = get(f2,'Position');
set(f2,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);
print(f2, 'ldo_load_sweep_2.pdf', '-dpdf');
movefile('ldo_load_sweep_2.pdf','../../../img/meas/ldo_load_sweep_2.pdf');
