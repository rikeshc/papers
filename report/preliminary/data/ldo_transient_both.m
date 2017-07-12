%% Load 
clear all;
load('ldo_tran_sch.mat');
load('ldo_tran_pex.mat');
% data includes     

%%
plotwidth = 1;
time = t_sch * 10^6;
timep = t_pex*10^6;
f1 = figure(1);
 p1 = plot(time, vreg_10m_sch, 'b'); hold on;
      %plot(time, vreg_100u_sch, 'r'); 
      plot(timep, vreg_10m_pex, 'r--');
      %plot(timep, vreg_100u_pex, 'r--');
      %hold off;
set(p1, 'linewidth', plotwidth);
grid on;

%printing point

% index1 = find(round(vreg_100u_sch, 3) == 1.8, 1);
index2 = find(round(vreg_10m_sch, 3) == 1.8, 1);
% index1p = find(round(vreg_100u_pex, 3) == 1.8, 1);
index2p = find(round(vreg_10m_pex, 3) == 1.8, 1);

% txt1 = sprintf('%d us', round(time(index1)));
txt2 = sprintf('%d us', round(time(index2)));
% txt1p = sprintf('%d us', round(timep(index1p)));
txt2p = sprintf('%d us', round(timep(index2p)));

% text(75, 1.85, txt1, 'color', 'r');
text(180, 1.87, txt2, 'color', 'b');
% text(75, 1.85, txt1p, 'color', 'r');
text(210, 1.87, txt2p, 'color', 'r');

% plot(time(index1), vreg_100u_sch(index1), '*r');
plot(time(index2), vreg_10m_sch(index2), '*b');
% plot(time(index1), vreg_100u_sch(index1), '*r');
plot(timep(index2p), vreg_10m_pex(index2p), '*r');
legend('Pre-layout', 'Post-layout', 'location', 'best');
title('Start up for 10 mA load', 'FontSize', 10);

xlabel('Time, us'); ylabel('Veg, V');
%xlim([0, 50]); 
ylim([0, 2]);

%% save image
set(f1,'Units','Inches');
pos = get(f1,'Position');
set(f1,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);
print(f1, 'ldo_transient_both.pdf', '-dpdf');
movefile('ldo_transient_both.pdf','../img/ldo_transient_both.pdf');