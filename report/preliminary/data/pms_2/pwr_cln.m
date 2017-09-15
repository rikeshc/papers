clear all;
load('IP_sch.mat');
load('IP_pex.mat');
Vac = 2.5;
%% 
figure(1); plot(t_sch, pwr_sch);
figure(2); plot(t_pex, pwr_pex);
figure(3); plot(t_sch, Iac_sch);
figure(4); plot(t_pex, Iac_pex);
%%
% power from average
power_avg_sch = mean(pwr_sch)*1000; % mW
power_avg_pex = mean(pwr_pex)*1000; % mW

% power from rms
I_max_sch = max(Iac_sch);
I_max_pex = max(Iac_pex);
I_pex_rms = rms(Iac_pex);
I_sch_rms = rms(Iac_sch);
power_sch = I_sch_rms*Vac/sqrt(2)*1000; %mW
power_pex = I_pex_rms*Vac/sqrt(2)*1000; %mW

