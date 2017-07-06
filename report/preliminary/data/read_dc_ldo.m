%% Read transient ldo
clear all;
V = importdata('ldo_dc_pex.matlab');
dc_pex = V.data(:, 1);
vreg_dcu_pex = V.data(:, 2);
vreg_dcm_pex = V.data(:, 4);

%%
clear V;    %saving only required variables
save('ldo_dc_pex');
