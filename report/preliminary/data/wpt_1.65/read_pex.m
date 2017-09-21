%% Read VREC and VREG
clear all;
V = importdata('wpt_1.65_vout_pex.matlab');

t_pex = V.data(:, 1);
vrec_pex = V.data(:, 2);
vreg_pex = V.data(:, 4);

%%
clear V; 
%delete IP_sch.mat;   %saving only required variables
save('Vout_pex');

%% Read voltage data from file
clear all;
V = importdata('wpt_1.65_vs_pex.matlab');

t_pex = V.data(:, 1);
vreg_pex = V.data(:, 10);
vrec_pex = V.data(:, 8);
vac_pex = V.data(:, 2);
vin1_pex = V.data(:, 4);
vin2_pex = V.data(:, 6);
%vpri_pex = V.data(:, 8);
%vin_pex = vin1_pex - vin2_pex;

%%
clear V; 
 %saving only required variables
save('Vs_pex');

%% Read voltage data from file
clear all;
I = importdata('wpt_1.65_PI_pex.matlab');

t_pex = I.data(:, 1);
pwr_ac_pex = I.data(:, 12);
pwr_pms_pex = I.data(:, 14);
Iac_pex = I.data(:, 2);
Is_pex = I.data(:, 6);
Ip_pex = I.data(:, 4);
Ivin1_pex = I.data(:, 10);
Ivin2_pex = I.data(:, 8);

%%
clear I;
%delete IP_sch.mat;   %saving only required variables
save('PI_pex');
