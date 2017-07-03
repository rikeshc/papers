%% Read voltage data from file
clear all;
V = importdata('rectifier_pex_V.matlab');
t_pex = V.data(:, 1);
V1_pex = V.data(:, 2);
V2_pex = V.data(:, 4);
Vac_pex = V.data(:, 8);
Vrec_pex = V.data(:, 6);

%%
clear V;    %saving only required variables
save('V_pex');
