%% Read from file ce schematic
clear all;
ce_sch = importdata('rectifier_sch_ce.matlab');
Vac = ce_sch.data(:, 1);
vce = ce_sch.data(:, 2);
pce = ce_sch.data(:, 4);
ppce = ce_sch.data(:, 6);

clear ce_sch;    %saving only required variables
save('ce_sch');

%% Read from file vce pex
clear all;
vce_pex = importdata('rectifier_vce_pex.matlab');
Vac_pex = vce_pex.data(:, 1);
vce_pex = vce_pex.data(:, 2);

clear ce_sch;    %saving only required variables
save('vce_pex');
