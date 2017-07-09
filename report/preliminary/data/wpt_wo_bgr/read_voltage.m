%% Read voltage data from file
clear all;
V = importdata('wpt_V_pex.matlab');
t_pex = V.data(:, 1);
Vin1_pex = V.data(:, 2);
Vin2_pex = V.data(:, 4);
Vrec_pex = V.data(:, 6);
Vreg_pex = V.data(:, 8);

%%
clear V;    %saving only required variables
save('V_pex');
