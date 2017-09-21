%% Read current and power SCH
clear all;
I = importdata('pms_PI_sch.matlab');

t_sch = I.data(:, 1);
pwr_ac_sch = I.data(:, 8);
pwr_pms_sch = I.data(:, 10);
Iac_sch = I.data(:, 2);
Ivin2_sch = I.data(:, 6);
Ivin1_sch = I.data(:, 4);


%%
clear I;   %saving only required variables
save('PI_sch.mat');

%% Read current and power PEX
clear all;
I = importdata('pms_PI_pex.matlab');

t_pex = I.data(:, 1);
pwr_ac_pex = I.data(:, 8);
pwr_pms_pex = I.data(:, 10);
Iac_pex = I.data(:, 2);
Ivin2_pex = I.data(:, 6);
Ivin1_pex = I.data(:, 4);

%%
clear I;   %saving only required variables
save('PI_pex.mat');

