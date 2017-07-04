%% Load 
% 
clear all;
load('ldo_pssr_sch.mat');
% data includes 

%%
plotwidth = 1;
logdB = 20*log10(Re);
f1 = figure(1);
semilogx(freq, logdB);
legend1 = sprintf('PSSR @ 13.56 MHz: %.f dB', logdB(143));
l1 = legend(legend1, 'location', 'best');
ylabel('dB'); xlabel('Frequency, Hz');
xlim([1, 10^8.2]); 
grid on;


%% save image
set(f1,'Units','Inches');
pos = get(f1,'Position');
set(f1,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);
print(f1, 'ldo_pssr.pdf', '-dpdf');
movefile('ldo_pssr.pdf','../img/ldo_pssr.pdf');