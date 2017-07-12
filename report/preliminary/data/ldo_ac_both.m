%% Load 
% 
clear all;
load('ldo_ac_sch.mat');
load('ldo_ac_S.mat');
load('ldo_ac_Sp.mat');
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
l1 = legend('Gain', 'PM', 'location', 'best');
v1 = get(l1,'title');
%set(v1,'string','Unstable');
%xlabel('Magnitude, V'); ylabel('Veg, V');
xlim([1, 10^9]);
title('Unstable', 'FontSize', 10);

subplot(2, 1, 2);
yyaxis left;
p2 = semilogx(U_freq, S_mag); hold on;
        semilogx(U_freq, Sp_mag, '--')
        ylim([-50, 100]); ylabel('dB');
        yyaxis right;
        ylabel('PM');
        semilogx(U_freq, S_PM);
        semilogx(U_freq, Sp_PM, '--');
        %ylim([-40, 200]);
set(p2, 'linewidth', plotwidth);
grid on;
legend1 = sprintf('Schematic, GM = %d dB', 25);
legend2 = sprintf('Schematic, PM = %d%c', 74, char(176));
legend1p = sprintf('Post-layout, GM = %d dB', 0);
legend2p = sprintf('Post-layout, PM = %d', 0);
l2 = legend(legend1, legend1p, legend2 , legend2p,'location', 'best');
v2 = get(l2,'title');
%set(v2,'string','Stable');

xlabel('Frquency, Hz'); 
xlim([1, 10^9]); 
title('Stable', 'FontSize', 10);


%% save image
set(f1,'Units','Inches');
pos = get(f1,'Position');
set(f1,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);
print(f1, 'ldo_ac_both.pdf', '-dpdf');
movefile('ldo_ac_both.pdf','../img/ldo_ac_both.pdf');