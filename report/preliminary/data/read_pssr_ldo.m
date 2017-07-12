%% Read transient ldo
clear all;
sch = importdata('ldo_pssr_sch.matlab');
freq_sch = sch.data(:, 1);
Re_sch = sch.data(:, 2);
Img_sch = sch.data(:, 3);

%%
clear sch;    %saving only required variables
save('ldo_pssr_sch');


%% Read transient ldo
clear all;
pex = importdata('ldo_pssr_pex.matlab');
freq_pex = pex.data(:, 1);
Re_pex = pex.data(:, 2);
Img_pex = pex.data(:, 3);

%%
clear pex;    %saving only required variables
save('ldo_pssr_pex');
