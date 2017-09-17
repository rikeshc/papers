clear all;
V = importdata('1ma_pex.matlab');
t_pex = V.data(:, 1);
Vrec_pex = V.data(:, 2);
Vin1_pex = V.data(:, 4);
Vin2_pex = V.data(:, 6);

%% Save
clear V;    %saving only required variables
save('pex_1ma');