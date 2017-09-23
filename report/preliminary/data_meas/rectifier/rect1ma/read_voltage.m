clear all;
V = importdata('1ma_pex.matlab');
t_pex = V.data(:, 1);
Vrec_pex = V.data(:, 2);
Vin1_pex = V.data(:, 4);
Vin2_pex = V.data(:, 6);

%% Save
clear V;    %saving only required variables
save('pex_1ma');

%%
clear all;
I = importdata('1ma_currents.matlab');
t_pex = I.data(:, 1);
Iac_pex = I.data(:, 2);
Ivin2_pex = I.data(:, 4);
Ivin1_pex = I.data(:, 6);

%% Save
clear I;    %saving only required variables
save('pex_1ma_current');