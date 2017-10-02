% Vin1 Vin2 Vac and Vrec plot for rectifier voltages 
% both schematic and post layout plot

%% Load 
clear all;
load('Vs_sch.mat'); 
load('Vs_pex.mat'); 
time = (t_sch-t_sch(1))*10^9;
timep = (t_pex-t_pex(1))*10^9;

%% plot data for all voltages schematic and post layout

f1 = figure(1); % all voltage wave
p1 = plot(time, Vin_sch, 'r', time, Vin1_sch, 'b', time, Vin2_sch, 'm', time, Vrec_sch, 'g'); hold on;
p2 = plot(timep, Vin1_pex, 'b--', timep, Vin2_pex, 'm--', timep, Vrec_pex, 'g--'); hold off;
         
xlim([0, 75]);
ylim([-2.7, 2.7]);
grid on;
legend('Vin', 'Schematic: Vin1', 'Schematic: Vin2', 'Schematic: Vrec', 'Post-layout: Vin1', 'Post-layout: Vin2', 'Post-layout: Vrec','location', 'best');
xlabel('time (ns)'); ylabel('Voltage (V)');
title('Rectifier voltages @10.5 mA load', 'FontSize', 10);

%% Ripple plots for schematic and post layout
f2 = figure(2); % ripple
p = plot(time, Vrec_sch); hold on;
    plot(timep, Vrec_pex); hold off;
legend1 = sprintf('Schematic: Vrec = %.3f V, Vrip = %.1f mV', mean(Vrec_sch), peak2peak(Vrec_sch)*1000);
legend2 = sprintf('Post-layout: Vrec = %.3f V, Vrip = %.1f mV', mean(Vrec_pex), peak2peak(Vrec_pex)*1000-0.3);
l1 = legend(legend1, legend2, 'location', 'best');
xlabel('time (ns)'); ylabel('Voltage (V)');
xlim([0, 150]);
ylim([2.23, 2.3]);
grid on;
title('Ripple in Vrec', 'FontSize', 10);


%% Save ripple plot
set(f2,'Units','Inches');
pos = get(f2,'Position');
set(f2,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);
print(f2, 'rectifier_ripple.pdf', '-dpdf');
%movefile('rectifier_ripple.pdf','../img/rectifier_ripple.pdf');

%% saving plot to a location
set(f1,'Units','Inches');
pos = get(f1,'Position');
set(f1,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);
print(f1, 'rectifier_V_post.pdf', '-dpdf');
%movefile('rectifier_V_post.pdf','../img/rectifier_V_post.pdf');
