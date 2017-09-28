clear all;
vrec = importdata('C1vrec_pms00000.dat');
vin1 = importdata('C1vin1_pms00000.dat');
vin2 = importdata('C4vin2_pms00000.dat');
vreg = importdata('C1vreg_pms00000.dat');
vin = importdata('F1vin_pms00000.dat');

time = vrec(:,1)*10^9+250; % time in ns

f1 = figure(1);
plot(time, vin1(:,2), time, vin2(:,2), time, vin(:,2), time, vrec(:,2), time, vreg(:,2));
grid on;
%ylim([1.5, 2.7]);
rec = sprintf('V_{rec} = %.3f V, Ripple = %.0f mV', mean(vrec(:,2)), peak2peak(vrec(:,2))*1000);
reg = sprintf('V_{reg} = %.3f V, Ripple = %.0f mV', mean(vreg(:,2)), peak2peak(vreg(:,2))*1000);

xlim([63, 221]);
ylim([-3.5, 3]);
xlabel('Time, ns');
ylabel('Voltages, V');

legend('V_{in1}', 'V_{in2}', 'V_{in}', rec, reg, 'location', 'best');
title('PMS: Measured voltage waveforms', 'FontSize', 10);

%% save PMS performance
set(f1,'Units','Inches');
pos = get(f1,'Position');
set(f1,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);
print(f1, 'pms_test.pdf', '-dpdf');
movefile('pms_test.pdf','../../img/meas/pms_test.pdf');