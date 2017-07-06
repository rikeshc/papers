%% Read transient ldo
clear all;
V = importdata('ldo_loadr_trans_pex.matlab');
time_pex = V.data(:, 1);
Iload_lr_pex = V.data(:, 2);            
vreg_lr_pex = V.data(:, 4);

%%
clear V;    %saving only required variables
save('ldo_loadr_tran_pex');
