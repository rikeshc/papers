%% Read current and power SCH
clear all;
I = importdata('rect_I_sch.matlab');

t_sch = I.data(:, 1);
Ivin2_sch = I.data(:, 2);
Ivin1_sch = I.data(:, 4);


%%
clear I;   %saving only required variables
save('I_sch.mat');

%% Read current and power PEX
clear all;
I = importdata('rect_I_pex.matlab');

t_pex = I.data(:, 1);
Ivin2_pex = I.data(:, 2);
Ivin1_pex = I.data(:, 4);

%%
clear I;   %saving only required variables
save('I_pex_mod.mat');

