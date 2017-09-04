%clear all;
load('/uio/hume/student-u18/rikeshc/Rikesh/mast/mat_files/IP_sch.mat');
%load('/uio/hume/student-u18/rikeshc/Rikesh/mast/mat_files/V_sch.mat');

time = t_sch*10^6;

from = find(3000 ==round(time, 2), 1);
to = find(3000 + 0.5 ==round(time, 2), 1);
subplot(2, 1, 1);
plot(time(from:end), abs(vac_sch(from:end)./Iac_sch(from:end)));
ylim([0, 300]);
xlim([3000, 3000.15]);
grid on;
subplot(2, 1, 2);
plot(time(from:end), vac_sch(from:end));hold on;
plot(time(from:end), vin1_sch(from:end));
plot(time(from:end), vin2_sch(from:end));
plot(time(from:end), vin1_sch(from:end)-vin2_sch(from:end));
hold off;
xlim([3000, 3000.15]);
grid on;
