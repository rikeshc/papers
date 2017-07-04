%% Read transient ldo
clear all;
U = importdata('ldo_pssr.matlab');
freq = U.data(:, 1);
Re = U.data(:, 2);
Img = U.data(:, 3);



%%
clear U;    %saving only required variables
save('ldo_pssr_sch');
