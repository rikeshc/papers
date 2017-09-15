%% Read Vrec and Vreg 
clear all;
V = importdata('pms_Vout_sch.matlab');
t_sch = V.data(:, 1);
Vrec_sch = V.data(:, 4);
Vreg_sch = V.data(:, 2);

%% Save
clear V;    %saving only required variables
save('Vout_sch');

%% Read all voltages
clear all;
V = importdata('pms_Vs_sch.matlab');
t_sch = V.data(:, 1);
Vin1_sch = V.data(:, 6);
Vin2_sch = V.data(:, 8);
Vrec_sch = V.data(:, 4);
Vreg_sch = V.data(:, 2);
Vin_sch = Vin1_sch - Vin2_sch;
Vpri_sch = V.data(:, 10);

%% Save
clear V;    %saving only required variables
save('Vs_sch');

%% Read Vrec and Vreg of PEX
clear all;
V = importdata('pms_vout_pex.matlab');
t_pex = V.data(:, 1);
Vrec_pex = V.data(:, 4);
Vreg_pex = V.data(:, 2);

%% Save
clear V;    %saving only required variables
save('Vout_pex');

%% Read all voltages PEX
clear all;
V = importdata('pms_vs_pex.matlab');
t_pex = V.data(:, 1);
Vin1_pex = V.data(:, 6);
Vin2_pex = V.data(:, 8);
Vrec_pex = V.data(:, 2);
Vreg_pex = V.data(:, 4);
Vac_pex = V.data(:, 10);
Vpri_pex = V.data(:, 12);
Vin_pex = Vin1_pex - Vin2_pex;

%% Save
clear V;    %saving only required variables
save('Vs_pex');


%% TEST
V = importdata('pms_Vac_sch.matlab');
%%
Vac_sch =V.data(:, 2);

%%
%load('Vs_sch.mat');
clear V;    %saving only required variables
save('Vs_sch');