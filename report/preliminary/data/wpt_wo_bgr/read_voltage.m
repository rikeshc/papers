%% Read voltage data from file
clear all;
V = importdata('wpt_V_pex.matlab');
t_pex = V.data(:, 1);
Vin1_pex = V.data(:, 2);
Vin2_pex = V.data(:, 4);
Vrec_pex = V.data(:, 6);
Vreg_pex = V.data(:, 8);
Vref_pex = V.data(:, 10);

%% Save
clear V; delete V_pex.mat;    %saving only required variables
save('V_pex');


%% Read voltage data from file
clear all;
V = importdata('wpt_V_sch.matlab');
t_sch = V.data(:, 1);
Vin1_sch = V.data(:, 2);
Vin2_sch = V.data(:, 4);
Vrec_sch = V.data(:, 6);
Vreg_sch = V.data(:, 8);
Vref_sch = V.data(:, 10);

%% Save
clear V; delete V_sch.mat;    %saving only required variables
save('V_sch');

