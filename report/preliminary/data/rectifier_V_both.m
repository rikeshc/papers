% Vin1 Vin2 Vac and Vrec plot for rectifier voltages 
% both schematic and post layout plot

%% Load 
clear all;
load('rectifier_V_sch.mat'); % data includes 150u to 200u trans
load('rectifier_V_pex.mat'); % data includes 40u to 80u trans

%% plot data for schematic data

from = 327;
to = 990;
from2 = 399;
to2 = to*3; % pex has finer resolution 
plotwidth = 1;
time2 = ((time-time(from))*10^9);
t_pex2 = ((t_pex-t_pex(from2))*10^9);
h = zeros(6, 1);
f1 = figure(1); % all voltage wave
p1 = plot(time2(from: to), Vin1(from: to), 'b'); hold on;
     plot(time2(from: to), Vin2(from: to), 'r');
     plot(time2(from: to), Vrec(from: to), 'g');

hold on;
p2 = plot(t_pex2(from2:to2), V1_pex(from2:to2), 'b--'); hold on;
     plot(t_pex2(from2:to2), V2_pex(from2:to2), 'r--');
     plot(t_pex2(from2:to2), Vrec_pex(from2:to2), 'g--');
     
    h(1) = plot(NaN,NaN,'b');
    h(2) = plot(NaN,NaN,'r');
    h(3) = plot(NaN,NaN,'g');
    h(4) = plot(NaN,NaN,'b--');
    h(5) = plot(NaN,NaN,'r--');
    h(6) = plot(NaN,NaN,'g--');
   
set(p1, 'linewidth', plotwidth);
grid on;

legend('Vin1, schematic', 'Vin2, schematic', 'Vrec, schematic', 'Vin1, layout', 'Vin2, layout', 'Vrec, layout', 'location', 'best');
%legend([p1 p2], 'schematic', 'post-layout');
%ht = text(5, 0.5, {'{\color{red} o } Red', '{\color{blue} o } Blue', '{\color{black} o } Black'}, 'EdgeColor', 'k');
%legend( 'Vin1', 'Vin2','Vrec', 'Vrec:post', 'Vin1:post', 'Vin2:post', 'location', 'best');
xlabel('time (ns)'); ylabel('Voltage (V)');
xlim([0, 74]); 
ylim([-0.25, 2.5]);
%%
f2 = figure(2); % ripple
p = plot(time2(from: to), Vrec(from: to)); hold on;
    plot(t_pex2(from2:to2), Vrec_pex(from2:to2)); hold off;
set(p, 'linewidth', plotwidth);
legend1 = sprintf('Schematic: Vrec = %.3f V, Vrip = %.1f mV', mean(Vrec), peak2peak(Vrec)*1000);
legend2 = sprintf('Post-layout: Vrec = %.3f V, Vrip = %.1f mV', mean(Vrec_pex), peak2peak(Vrec_pex)*1000);
l1 = legend(legend1, legend2, 'location', 'best');
xlabel('time (ns)'); ylabel('Voltage (V)');
xlim([0, 150]);
grid on;

%% both Vrec
plot(time2, Vrec, t_pex2, Vrec_pex);
ylim([-0.1, 2.5]);


%% Save ripple plot
set(f2,'Units','Inches');
pos = get(f2,'Position');
set(f2,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);
print(f2, 'rectifier_ripple.pdf', '-dpdf');
movefile('rectifier_ripple.pdf','../img/rectifier_ripple.pdf');

%% saving plot to a location
set(f1,'Units','Inches');
pos = get(f1,'Position');
set(f1,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);
print(f1, 'rectifier_V_post.pdf', '-dpdf');
movefile('rectifier_V_post.pdf','../img/rectifier_V_post.pdf');
