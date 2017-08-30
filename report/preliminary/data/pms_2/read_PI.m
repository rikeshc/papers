%% Read voltage data from file
clear all;
I = importdata('pms_PI_sch.matlab');

t_sch = I.data(:, 1);
pwr_ac_sch = I.data(:, 10);
pwr_pms_sch = I.data(:, 8);
Iac_sch = I.data(:, 6);
Ipri_sch = I.data(:, 2);
Isec_sch = I.data(:, 4);

%%
clear I;   %saving only required variables
save('PI_sch');



%% Read voltage data from file
clear all;
Iac = importdata('PI_pex.matlab');

t_pex = Iac.data(:, 1);
pwr_pex = Iac.data(:, 4);
Iac_pex = Iac.data(:, 2);

%%
clear Iac;  %saving only required variables
save('IP_pex_2');