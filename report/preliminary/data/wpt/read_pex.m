%% Read voltage data from file
clear all;
V = importdata('wpt_V_pex.matlab');

t_pex = V.data(:, 1);
vreg_pex = V.data(:, 6);
vrec_pex = V.data(:, 8);
vac_pex = V.data(:, 10);
vin1_pex = V.data(:, 2);
vin2_pex = V.data(:, 4);

%%
clear V; 
%delete IP_sch.mat;   %saving only required variables
save('V_pex');

%% Read voltage data from file
clear all;
I = importdata('wpt_PI_pex.matlab');

t_pex = I.data(:, 1);
pwr_pex = I.data(:, 8);
Iac_pex = I.data(:, 2);
Is_pex = I.data(:, 6);
Ip_pex = I.data(:, 4);

%%
clear I;
%delete IP_sch.mat;   %saving only required variables
save('IP_pex');
