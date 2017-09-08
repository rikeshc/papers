function [vrms] = MeasAvg (Channel, HP54622Adr)
if nargin==1, 
	HP54622Adr=HP54622_DefaultAdr; 
end
% Clear measurment memory
GPIB_Write('MEAS:CLE', HP54622Adr) 

%Select choosed Channel
cmdstr = sprintf(':CHAN%d:DISP ON',Channel);
GPIB_Write (cmdstr,HP54622Adr);

% Measure VAVG on Scope
%cmdstr = sprintf('MEAS:VAMP CHAN%d',Channel);
cmdstr = sprintf('MEAS:VAV CHAN%d',Channel);
GPIB_Write(cmdstr, HP54622Adr)

% Query: measure VRMS?  and return VRMS value in Volt
cmdstr = sprintf('MEAS:VAV? CHAN%d',Channel);
GPIB_Write(cmdstr, HP54622Adr);
% fprintf(HP54622Adr, cmdstr);
vr = GPIB_Read(HP54622Adr);
% Convert to integer
vrms=str2num(vr);
