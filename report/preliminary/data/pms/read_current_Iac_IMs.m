%% Read voltage data from file
clear all;
Iac = importdata('PI_sch.matlab');

t_sch = Iac.data(:, 1);
pwr_sch = Iac.data(:, 4);
Iac_sch = Iac.data(:, 2);

%%
clear Iac;   %saving only required variables
save('IP_sch_2');



%% Read voltage data from file
clear all;
Iac = importdata('PI_pex.matlab');

t_pex = Iac.data(:, 1);
pwr_pex = Iac.data(:, 4);
Iac_pex = Iac.data(:, 2);

%%
clear Iac;  %saving only required variables
save('IP_pex_2');