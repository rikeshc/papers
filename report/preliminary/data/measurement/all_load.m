ma1 = load('load_1mA');
ma2 = load('load_2mA');
ma3 = load('load_3mA');
ma4 = load('load_4mA');
ma5 = load('load_5mA');
time = ma1.time+100;

%%
plot(time, ma1.Vrec, 'r', time, ma2.Vrec, 'g', time, ma3.Vrec, 'b', time, ma4.Vrec, 'm', time, ma5.Vrec, 'c'); hold on;
plot(time, ma1.Vreg, 'r--', time, ma2.Vreg, 'g--', time, ma3.Vreg, 'b--', time, ma4.Vreg, 'm--', time, ma5.Vreg, 'c--');
hold off;
grid on;
ylim([0, 2.5]);
xlabel('Time (ns)'); 
ylabel('Voltage (V)');

vrec1 = sprintf('Load = 1 mA, Avg. V_{rec} = %.3f', ma1.Vrec_avg);
vrec2 = sprintf('Load = 2 mA, Avg. V_{rec} = %.3f', ma2.Vrec_avg);
vrec3 = sprintf('Load = 3 mA, Avg. V_{rec} = %.3f', ma3.Vrec_avg);
vrec4 = sprintf('Load = 4 mA, Avg. V_{rec} = %.3f', ma4.Vrec_avg);
vrec5 = sprintf('Load = 5 mA, Avg. V_{rec} = %.3f', ma5.Vrec_avg);
vreg1 = sprintf('Load = 1 mA, Avg. V_{reg} = %.3f', ma1.Vreg_avg);
vreg2 = sprintf('Load = 2 mA, Avg. V_{reg} = %.3f', ma2.Vreg_avg);
vreg3 = sprintf('Load = 3 mA, Avg. V_{reg} = %.3f', ma3.Vreg_avg);
vreg4 = sprintf('Load = 4 mA, Avg. V_{reg} = %.3f', ma4.Vreg_avg);
vreg5 = sprintf('Load = 5 mA, Avg. V_{reg} = %.3f', ma5.Vreg_avg);

legend(vrec1, vrec2, vrec3, vrec4, vrec5, vreg1, vreg2, vreg3, vreg4, vreg5, 'location', 'best');

title('V_{rec} and V_{reg} for various load', 'FontSize', 10);