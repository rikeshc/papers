%% Read transient ldo
clear all;
V = importdata('ldo_dc_Iload.matlab');
Iload_sch = V.data(:, 1);
vreg_sch = V.data(:, 2);


%%
clear V;    %saving only required variables
save('ldo_Iload_sch');
