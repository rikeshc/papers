%% Read transient ldo
clear all;
V = importdata('ldo_liner_tran.matlab');
time_sch = V.data(:, 1);
vrec_lr_sch = V.data(:, 4);
vreg_lr_sch = V.data(:, 2);

%%
clear V;    %saving only required variables
save('ldo_liner_tran_sch');
