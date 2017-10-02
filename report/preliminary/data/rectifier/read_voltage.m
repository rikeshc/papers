
%% Read all voltages
clear all;
V = importdata('rect_vs_sch.matlab');
t_sch = V.data(:, 1);
Vac_sch = V.data(:, 2);
Vin1_sch = V.data(:, 4);
Vin2_sch = V.data(:, 6);
Vrec_sch = V.data(:, 8);
Vin_sch = Vin1_sch - Vin2_sch;
%Vpri_sch = V.data(:, 10);

%% Save
clear V;    %saving only required variables
save('Vs_sch');

%% Read all voltages PEX
clear all;
V = importdata('rect_vs_pex.matlab');
t_pex = V.data(:, 1);
Vac_pex = V.data(:, 2);
Vin1_pex = V.data(:, 4);
Vin2_pex = V.data(:, 6);
Vrec_pex = V.data(:, 8);
Vin_pex = Vin1_pex - Vin2_pex;

%% Save
clear V;    %saving only required variables
save('Vs_pex');