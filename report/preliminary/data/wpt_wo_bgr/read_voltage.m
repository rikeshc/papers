%% Read voltage data from file
clear all;
V = importdata('wpt_V_sch.matlab');
t_sch = V.data(:, 1);
Vin1_sch = V.data(:, 2);
Vin2_sch = V.data(:, 4);
Vrec_sch = V.data(:, 6);
Vreg_sch = V.data(:, 8);

%%
clear V;    %saving only required variables
save('V_sch');
