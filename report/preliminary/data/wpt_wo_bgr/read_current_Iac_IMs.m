%% Read voltage data from file
clear all;
Iac = importdata('wpt_IP_sch.matlab');

t_sch = Iac.data(:, 1);
pwr_sch = Iac.data(:, 2);
Iac_sch = Iac.data(:, 4);

%%
clear Iac; delete IP_sch.mat;   %saving only required variables
save('IP_sch');



%% Read voltage data from file
clear all;
Iac = importdata('wpt_IP_pex.matlab');

t_pex = Iac.data(:, 1);
pwr_pex = Iac.data(:, 8);
Iac_pex = Iac.data(:, 6);

%%
clear Iac Irec pwr; delete IP_pex.mat;  %saving only required variables
save('IP_pex');