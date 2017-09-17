clear all;
V = importdata('currents_pex.matlab');
Vin_pex = V.data(:, 1);
Ileak_pex = V.data(:, 2);
Iin_pex = V.data(:, 4);

%% Save
clear V;    %saving only required variables
save('current_pex');

%%
clear all;
V = importdata('vreg_pex.matlab');
Vin_pex = V.data(:, 1);
Vreg_pex = V.data(:, 2);

%% Save
clear V;    %saving only required variables
save('vreg_pex');


%%
clear all;
V = importdata('Iload_sweep_pex.matlab');
Iload_pex = V.data(:, 1);
Vreg_pex = V.data(:, 2);

%% Save
clear V;    %saving only required variables
save('iload_sweep_pex');

%%
clear all;
V = importdata('Iload_sweep_is_pex.matlab');
Iload_pex = V.data(:, 1);
Isrc_pex = V.data(:, 2);

%% Save
clear V;    %saving only required variables
save('iload_sweep_isrc_pex');