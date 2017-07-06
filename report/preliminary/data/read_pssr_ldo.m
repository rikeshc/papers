%% Read transient ldo
clear all;
U = importdata('ldo_pssr_sch.matlab');
freq_sch = U.data(:, 1);
Re_sch = U.data(:, 2);
Img_sch = U.data(:, 3);



%%
clear U;    %saving only required variables
save('ldo_pssr_sch');
