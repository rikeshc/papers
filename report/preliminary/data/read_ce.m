%% Read voltage data from file
clear all;
V = importdata('rect_pce_pex.matlab');
Vac_pex2 = V.data(:, 1);
ppce_pex = V.data(:, 2);

%%
clear V;    %saving only required variables
save('rectifier_pce_pex');
