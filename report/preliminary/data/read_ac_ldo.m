%% Read transient ldo
clear all;
U = importdata('ldo_ac_unstable.matlab');
U_freq = U.data(:, 1);
U_mag = U.data(:, 4);
U_PM = U.data(:, 2);

S = importdata('ldo_ac_stable.matlab');
S_freq = S.data(:, 1);
S_mag = S.data(:, 4);
S_PM = S.data(:, 2);


%%
clear V U;    %saving only required variables
save('ldo_ac_sch');
