%% Read voltage data from file
clear all;
Iac = importdata('wpt_Iac_sch.matlab');
Irec = importdata('wpt_Irect_sch.matlab');
pwr = importdata('wpt_pwr_sch.matlab');

t_ac_sch = Iac.data(:, 1);
Iac_sch = Iac.data(:, 2);

%t_rec_sch = Irec.data(:, 1);
IM0_sch = Irec.data(:, 2);
IM1_sch = Irec.data(:, 4);

%t_pwr_sch = pwr.data(:, 1);
pwr_sch = pwr.data(:, 2);



%%
clear Iac Irec pwr;    %saving only required variables
save('IP_sch');
