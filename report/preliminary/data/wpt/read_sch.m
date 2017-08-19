%% Read voltage data from file
clear all;
V = importdata('V_sch.matlab');

t_sch = V.data(:, 1);
vreg_sch = V.data(:, 2);
vrec_sch = V.data(:, 4);
vac_sch = V.data(:, 6);
vin1_sch = V.data(:, 8);
vin2_sch = V.data(:, 10);

%%
clear V; 
%delete IP_sch.mat;   %saving only required variables
save('V_sch');

%% Read voltage data from file
clear all;
I = importdata('PI_sch.matlab');

t_sch = I.data(:, 1);
pwr_sch = I.data(:, 2);
Iac_sch = I.data(:, 4);
Is_sch = I.data(:, 6);
Ip_sch = I.data(:, 8);

%%
clear I;
%delete IP_sch.mat;   %saving only required variables
save('IP_sch');
