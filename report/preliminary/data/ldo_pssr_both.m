%% Load 
% 
clear all;
load('ldo_pssr_sch.mat');
load('ldo_pssr_pex.mat');
% data includes 

%%
plotwidth = 1;
logdB = 20*log10(sqrt(Re_sch.^2 + Img_sch.^2));
logdBp = 20*log10(sqrt(Re_pex.^2 + Img_pex.^2));
f1 = figure(1);
semilogx(freq_sch, logdB);hold on;
semilogx(freq_pex, logdBp, '--');

legend1 = sprintf('Schematic, @13.56 MHz: %.f dB', logdB(358));
legend2 = sprintf('Post-layout,  @13.56 MHz: %.f dB', logdBp(358));
l1 = legend(legend1, legend2, 'location', 'best');
ylabel('dB'); xlabel('Frequency, Hz');
xlim([1, 10^9]); 
%ylim([-80, -35]); 
grid on;
%set(gca,'XScale','log');
title('Supply noise rejection', 'FontSize', 10);


%% save image
set(f1,'Units','Inches');
pos = get(f1,'Position');
set(f1,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);
print(f1, 'ldo_pssr_both.pdf', '-dpdf');
movefile('ldo_pssr_both.pdf','../img/ldo_pssr_both.pdf');