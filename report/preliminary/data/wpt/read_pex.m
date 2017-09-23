%% Read VREC and VREG
clear all;
V = importdata('wpt_vout_pex.matlab');

t_pex = V.data(:, 1);
vreg_pex = V.data(:, 4);
vrec_pex = V.data(:, 2);

%%
clear V; 
%delete IP_sch.mat;   %saving only required variables
save('Vout_pex');

%% Read voltage data from file
clear all;
V = importdata('wpt_vs_pex.matlab');

t_pex = V.data(:, 1);
vac_pex = V.data(:, 2);
vpri_pex = V.data(:, 4);
vin1_pex = V.data(:, 6);
vin2_pex = V.data(:, 8);
vreg_pex = V.data(:, 12);
vrec_pex = V.data(:, 10);

%%
clear V; 
 %saving only required variables
save('Vs_pex');

%% Read voltage data from file
clear all;
I = importdata('wpt_PI_pex.matlab');

t_pex = I.data(:, 1);
Iac_pex = I.data(:, 2);
Ip_pex = I.data(:, 4);
Is_pex = I.data(:, 6);
Ivin1_pex = I.data(:, 10);
Ivin2_pex = I.data(:, 8);
pwr_ac_pex = I.data(:, 12);
pwr_pms_pex = I.data(:, 14);
pwr_il_pex = I.data(:, 16);


%%
clear I;
%delete IP_sch.mat;   %saving only required variables
save('PI_pex');
