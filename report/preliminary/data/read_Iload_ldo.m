%% Read transient ldo
clear all;
V = importdata('ldo_Iload_sch.matlab');
Iload_sch = V.data(:, 1);
vreg_sch = V.data(:, 2);


%%
clear V;    %saving only required variables
save('ldo_Iload_sch');


%% Read transient ldo
clear all;
V = importdata('ldo_Iload_pex.matlab');
Iload_pex = V.data(:, 1);
vreg_pex = V.data(:, 2);


%%
clear V;    %saving only required variables
save('ldo_Iload_pex');