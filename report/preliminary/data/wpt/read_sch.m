%% Read VREC and VREG
clear all;
V = importdata('wpt_vout_sch.matlab');

t_sch = V.data(:, 1);
vreg_sch = V.data(:, 4);
vrec_sch = V.data(:, 2);

%%
clear V; 
%delete IP_sch.mat;   %saving only required variables
save('Vout_sch');

%% Read all voltages data from file
clear all;
V = importdata('wpt_vs_sch.matlab');

t_sch = V.data(:, 1);
vreg_sch = V.data(:, 12);
vrec_sch = V.data(:, 10);
vac_sch = V.data(:, 2);
vin1_sch = V.data(:, 4);
vin2_sch = V.data(:, 6);
vpri_sch = V.data(:, 8);

%%
clear V; 
%delete IP_sch.mat;   %saving only required variables
save('Vs_sch');

%% Read voltage data from file
clear all;
I = importdata('wpt_PI_sch.matlab');

t_sch = I.data(:, 1);
pwr_ac_sch = I.data(:, 12);
pwr_pms_sch = I.data(:, 14);
Iac_sch = I.data(:, 2);
Is_sch = I.data(:, 6);
Ip_sch = I.data(:, 4);
Ivin1_sch = I.data(:, 10);
Ivin2_sch = I.data(:, 8);

%%
clear I;
%delete IP_sch.mat;   %saving only required variables
save('PI_sch');
