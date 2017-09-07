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

time = ma1.time + 100;

%%
f1= figure(1);
plot(time, ma1.Vrec, time, ma2.Vrec, time, ma3.Vrec, time, ma4.Vrec, time, ma5.Vrec); hold on;
plot(time, ma6.Vrec, time, ma7.Vrec, time, ma8.Vrec, time, ma9.Vrec, time, ma10.Vrec);
plot(time, ma1.Vreg, time, ma2.Vreg, time, ma3.Vreg, time, ma4.Vreg, time, ma5.Vreg); hold on;
plot(time, ma6.Vreg, time, ma7.Vreg, time, ma8.Vreg, time, ma9.Vreg, time, ma10.Vreg);hold off;
grid on;
ylim([0, 2.6]);
xlabel('Time (ns)'); 
ylabel('Voltage (V)');
vrec1 = sprintf('1 mA load, V_{rec} = %.3f V, V_{reg} = %.3f V', ma1.Vrec_avg, ma1.Vreg_avg);
vrec2 = sprintf('2 mA load, V_{rec} = %.3f V, V_{reg} = %.3f V', ma2.Vrec_avg, ma2.Vreg_avg);
vrec3 = sprintf('3 mA load, V_{rec} = %.3f V, V_{reg} = %.3f V', ma3.Vrec_avg, ma3.Vreg_avg);
vrec4 = sprintf('4 mA load, V_{rec} = %.3f V, V_{reg} = %.3f V', ma4.Vrec_avg, ma4.Vreg_avg);
vrec5 = sprintf('5 mA load, V_{rec} = %.3f V, V_{reg} = %.3f V', ma5.Vrec_avg, ma5.Vreg_avg);
vrec6 = sprintf('6 mA load, V_{rec} = %.3f V, V_{reg} = %.3f V', ma6.Vrec_avg, ma6.Vreg_avg);
vrec7 = sprintf('7 mA load, V_{rec} = %.3f V, V_{reg} = %.3f V', ma7.Vrec_avg, ma7.Vreg_avg);
vrec8 = sprintf('8 mA load, V_{rec} = %.3f V, V_{reg} = %.3f V', ma8.Vrec_avg, ma8.Vreg_avg);
vrec9 = sprintf('9 mA load, V_{rec} = %.3f V, V_{reg} = %.3f V', ma9.Vrec_avg, ma9.Vreg_avg);
vrec10 = sprintf('10 mA load, V_{rec} = %.3f V, V_{reg} = %.3f V', ma10.Vrec_avg, ma10.Vreg_avg);

legend(vrec1, vrec2, vrec3, vrec4, vrec5,vrec6, vrec7, vrec8,vrec9, vrec10, 'location', 'best');

title('PMS: Measured V_{rec} and V_{reg} for various load', 'FontSize', 10);

%% save plot
set(f1,'Units','Inches');
pos = get(f1,'Position');
set(f1,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);
print(f1, 'pms_load_sweep.pdf', '-dpdf');
movefile('pms_load_sweep.pdf','../../../img/meas/pms_load_sweep.pdf');