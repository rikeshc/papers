%% Read Vrec and Vreg 
clear all;
V = importdata('pms_Vout_sch.matlab');
t_sch = V.data(:, 1);
Vrec_sch = V.data(:, 2);
Vreg_sch = V.data(:, 4);

%% Save
clear V;    %saving only required variables
save('Vout_sch');

%% Read all voltages
clear all;
V = importdata('pms_Vs_sch.matlab');
t_sch = V.data(:, 1);
Vin1_sch = V.data(:, 10);
Vin2_sch = V.data(:, 12);
Vrec_sch = V.data(:, 2);
Vreg_sch = V.data(:, 4);
Vac_sch = V.data(:, 6);
Vpri_sch = V.data(:, 8);

%% Save
clear V;    %saving only required variables
save('Vs_sch');

%% Read Vrec and Vreg of PEX
clear all;
V = importdata('pms_vout_pex.matlab');
t_pex = V.data(:, 1);
Vrec_pex = V.data(:, 2);
Vreg_pex = V.data(:, 4);

%% Save
clear V;    %saving only required variables
save('Vout_pex');

%% Read all voltages PEX
clear all;
V = importdata('pms_vs_pex.matlab');
t_pex = V.data(:, 1);
Vin1_pex = V.data(:, 4);
Vin2_pex = V.data(:, 6);
Vrec_pex = V.data(:, 10);
Vreg_pex = V.data(:, 12);
Vac_pex = V.data(:, 2);
Vpri_pex = V.data(:, 8);

%% Save
clear V;    %saving only required variables
save('Vs_pex');


