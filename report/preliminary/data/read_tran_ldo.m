%% Read transient ldo
clear all;
V = importdata('ldo_trans_post.matlab');
t_sch_pex = V.data(:, 1);
vreg_100u_pex = V.data(:, 2);   
vreg_10m_pex = V.data(:, 4);

%%
clear V;    %saving only required variables
save('ldo_tran_pex');
