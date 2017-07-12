%% Read Unstable ac
clear all;
U = importdata('ldo_ac_ustable.matlab');
U_freq = U.data(:, 1);
U_mag = U.data(:, 2);
U_PM = U.data(:, 4);

%%
clear U;
save('ldo_ac_sch');


%% Read Stable ac
clear all;
S = importdata('ldo_ac_stable.matlab');
S_freq = S.data(:, 1);
S_mag = S.data(:, 2);
S_PM = S.data(:, 4);

%%
clear S;    %saving only required variables
save('ldo_ac_S');


%% Read pex stable ac
clear all;
Sp = importdata('ldo_ac_pex.matlab');
Sp_freq = Sp.data(:, 1);
Sp_mag = Sp.data(:, 2);
Sp_PM = Sp.data(:, 4);


%%
clear Sp;    %saving only required variables
save('ldo_ac_Sp');
