clear all;
load('PI_sch.mat');
load('PI_pex.mat');
load('Vs_sch.mat');
load('Vs_pex.mat');

time = t_sch*10^6;
timep = t_pex*10^6;

vin_sch = vin1_sch - vin2_sch;
vin_pex = vin1_pex - vin2_pex;

[c,lag] = xcorr(vac_sch,Iac_sch);
[maxC,I]=max(c);


phase = lag(I);


[Amp, Ph_rad] = freqrespmeasure(vac_sch, Iac_sch);
%Ph_deg = radtodeg(Ph_rad);
Pwr = rms(Iac_sch) * rms(vac_sch)*cos(Ph_rad);

[Amp, Ph_rad] = freqrespmeasure(vac_pex, Iac_pex);
%Ph_deg = radtodeg(Ph_rad);
Pwr_pex = rms(Iac_pex) * rms(vac_pex)*cos(Ph_rad);