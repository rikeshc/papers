%% Read transient ldo
clear all;
V = importdata('ldo_dc.matlab');
dc_sch = V.data(:, 1);
vreg_dcu_sch = V.data(:, 2);
vreg_dcm_sch = V.data(:, 4);

%%
clear V;    %saving only required variables
save('ldo_dc_sch');
