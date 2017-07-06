%% Read transient ldo
clear all;
V = importdata('ldo_liner_trans_pex.matlab');
time_pex = V.data(:, 1);
vrec_lr_pex = V.data(:, 2);
vreg_lr_pex = V.data(:, 4);

%%
clear V;    %saving only required variables
save('ldo_liner_tran_pex');
