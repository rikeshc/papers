%% Load 
% 
clear all;
load('ldo_ac_sch.mat');
% data includes 

%%
plotwidth = 1;

f1 = figure(1);
subplot(2, 1, 1);
yyaxis left;
p1 = semilogx(U_freq, U_mag); hold on;
        ylim([-50, 100]); ylabel('dB');
        yyaxis right; 
        ylabel('PM');
        semilogx(U_freq, U_PM);
        ylim([-50, 200]);
set(p1, 'linewidth', plotwidth);
grid on;
l1 = legend('Magnitude', 'PM', 'location', 'best');
v1 = get(l1,'title');
set(v1,'string','Unstable');
%xlabel('Magnitude, V'); ylabel('Veg, V');
xlim([1, 10^8.2]); 

subplot(2, 1, 2);
yyaxis left;
p2 = semilogx(U_freq, S_mag); hold on;
        ylim([-50, 100]); ylabel('dB');
        yyaxis right;
        ylabel('PM');
        semilogx(U_freq, S_PM);
        ylim([-50, 200]);
set(p2, 'linewidth', plotwidth);
grid on;
legend1 = sprintf('GM = %d dB', 36);
legend2 = sprintf('PM = %d%c', 76, char(176));
l2 = legend(legend1, legend2 ,'location', 'best');
v2 = get(l2,'title');
set(v2,'string','Stable');

xlabel('Frquency, Hz'); 
xlim([1, 10^8.2]); 


%% save image
set(f1,'Units','Inches');
pos = get(f1,'Position');
set(f1,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);
print(f1, 'ldo_ac.pdf', '-dpdf');
movefile('ldo_ac.pdf','../img/ldo_ac.pdf');