%% Comparision for 10 mA measured and simulated

clear all;
load('load_10mA');
%load('/uio/hume/student-u18/rikeshc/Rikesh/mast/papers/report/preliminary/data/rectifier_V_pex.mat');
load('/uio/hume/student-u18/rikeshc/Rikesh/mast/papers/report/preliminary/data/pms_2/Vs_pex.mat');
time = time;%*10^9;
% time_pex = (t_pex-t_pex(1))*10^9 - 54;
time_pex = (t_pex-t_pex(1))*10^9 - 75;

f1 = figure(1);
h1 = plot(time, Vin1 ,'r', time, Vin2 ,'b', time, Vrec ,'g'); 
hold on;
plot(time, Vin, 'm'); 

%h2 = plot(time_pex, V1_pex, 'r--', time_pex, V2_pex, 'b--', time_pex, Vrec_pex ,'g--');
h2 = plot(time_pex, Vin1_pex, 'r--', time_pex, Vin2_pex, 'b--', time_pex, Vrec_pex ,'g--');
plot(time_pex,(Vin1_pex-Vin2_pex), 'm--'); 
%plot(Na, NaN,'b', time, NaN, 'b--');
hold off;

xlim([25, 118]);

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


%% measured load sweep
clear all;

ma1 = load('load_1mA');
ma2 = load('load_2mA');
ma3 = load('load_3mA');
ma4 = load('load_4mA');
ma5 = load('load_5mA');
ma6 = load('load_6mA');
ma7 = load('load_7mA');
ma8 = load('load_8mA');
ma9 = load('load_9mA');
ma10 = load('load_10mA');
ma11 = load('load_11mA');
ma12 = load('load_12mA');
time = ma1.time;

f2 = figure(2);
plot(time, ma1.Vrec); hold on;
plot(time, ma2.Vrec);
plot(time, ma3.Vrec);
plot(time, ma4.Vrec);
plot(time, ma5.Vrec);
plot(time, ma6.Vrec);
plot(time, ma7.Vrec);
plot(time, ma8.Vrec);
plot(time, ma9.Vrec);
plot(time, ma10.Vrec);
plot(time, ma11.Vrec); hold off;
%plot(time, ma12.Vrec); hold off;


ylim([0, 2.7]);
xlabel('Time, ns');
ylabel('Vrec, V');
grid on;
title('Rectifier: Measured Vrec for various load', 'FontSize', 10);

vrec1 = sprintf('1 mA load: V_{rec} = %.3f V, Ripple = %.3f V', ma1.Vrec_avg, ma1.Vrec_rip);
vrec2 = sprintf('2 mA load: V_{rec} = %.3f V, Ripple = %.3f V', ma2.Vrec_avg, ma2.Vrec_rip);
vrec3 = sprintf('3 mA load: V_{rec} = %.3f V, Ripple = %.3f V', ma3.Vrec_avg, ma3.Vrec_rip);
vrec4 = sprintf('4 mA load: V_{rec} = %.3f V, Ripple = %.3f V', ma4.Vrec_avg, ma4.Vrec_rip);
vrec5 = sprintf('5 mA load: V_{rec} = %.3f V, Ripple = %.3f V', ma5.Vrec_avg, ma5.Vrec_rip);
vrec6 = sprintf('6 mA load: V_{rec} = %.3f V, Ripple = %.3f V', ma6.Vrec_avg, ma6.Vrec_rip);
vrec7 = sprintf('7 mA load: V_{rec} = %.3f V, Ripple = %.3f V', ma7.Vrec_avg, ma7.Vrec_rip);
vrec8 = sprintf('8 mA load: V_{rec} = %.3f V, Ripple = %.3f V', ma8.Vrec_avg, ma8.Vrec_rip);
vrec9 = sprintf('9 mA load: V_{rec} = %.3f V, Ripple = %.3f V', ma9.Vrec_avg, ma9.Vrec_rip);
vrec10 = sprintf('10 mA load: V_{rec} = %.3f V, Ripple = %.3f V', ma10.Vrec_avg, ma10.Vrec_rip);
vrec11 = sprintf('11 mA load: V_{rec} = %.3f V, Ripple = %.3f V', ma11.Vrec_avg, ma11.Vrec_rip);
vrec12 = sprintf('12 mA load: V_{rec} = %.3f V, Ripple = %.3f V', ma12.Vrec_avg, ma12.Vrec_rip);

legend(vrec1, vrec2, vrec3, vrec4, vrec5,vrec6, vrec7, vrec8,vrec9, vrec10,vrec11, 'location', 'best');

%% save plot
set(f2,'Units','Inches');
pos = get(f2,'Position');
set(f2,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);
print(f2, 'rect_load_sweep.pdf', '-dpdf');
movefile('rect_load_sweep.pdf','../../../img/meas/rect_load_sweep.pdf');

