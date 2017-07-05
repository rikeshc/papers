%% Load 
clear all;
load('ldo_tran_sch.mat');
% data includes     

%%
plotwidth = 1;
time = t_sch * 10^6;
f1 = figure(1);
p1 = plot(time, vreg_100u_sch, 'r'); hold on;
     plot(time, vreg_10m_sch, 'b');
set(p1, 'linewidth', plotwidth);
grid on;

%printing point

index1 = find(round(vreg_100u_sch, 3) == 1.8, 1);
index2 = find(round(vreg_10m_sch, 3) == 1.8, 1);
txt1 = sprintf('%d us', round(time(index1)));
txt2 = sprintf('%d us', round(time(index2)));
text(75, 1.85, txt1, 'color', 'r');
text(93, 1.85, txt2, 'color', 'b');
plot(time(index1), vreg_100u_sch(index1), '*r');
plot(time(index2), vreg_10m_sch(index2), '*b');
legend('Iload = 10 uA', 'Iload = 10 mA', 'location', 'best');

%legend1 = sprintf('Iload: 10 uA, Vreg = %.3f', mean(vreg_100u_sch(7798:end)));
%legend2 = sprintf('Iload: 10 mA, Vreg = %.3f', mean(vreg_10m_sch(9594:12000)));
%legend(legend1, legend2, 'location', 'best');
xlabel('Time, us'); ylabel('Veg, V');
%xlim([0, 50]); 
ylim([0, 2]);

%% save image
set(f1,'Units','Inches');
pos = get(f1,'Position');
set(f1,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)]);
print(f1, 'ldo_transient.pdf', '-dpdf');
movefile('ldo_transient.pdf','../img/ldo_transient.pdf');