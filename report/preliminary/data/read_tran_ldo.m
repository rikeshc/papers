%% Read transient ldo
clear all;
V = importdata('ldo_trans_sch.matlab');
t_sch = V.data(:, 1);
vreg_100u_sch = V.data(:, 2);   
vreg_10m_sch = V.data(:, 4);

%%
clear V;    %saving only required variables
save('ldo_tran_sch');
