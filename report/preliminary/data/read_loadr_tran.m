%% Read transient ldo
clear all;
V = importdata('ldo_loadr_tran_pex.matlab');
time_pex = V.data(:, 1);
Iload_lr_pex = V.data(:, 2);            
vreg_lr_pex = V.data(:, 4);

%%
clear V;    %saving only required variables
save('ldo_loadr_tran_pex');


%%
% Read transient ldo
clear all;
V = importdata('ldo_loadr_tran_sch.matlab');
time_sch = V.data(:, 1);
Iload_lr_sch = V.data(:, 2);            
vreg_lr_sch = V.data(:, 4);

%%
clear V;    %saving only required variables
save('ldo_loadr_tran_sch');

