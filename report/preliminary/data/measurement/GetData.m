function [time, data] = GetData(HP54622Adr)
% function [time, data] = HP54622_GetData(HP54622Adr):
% Skrevet av henningg@ifi.uio.no 10/5-2004
% Drastically changed by Håkon A. Hjortland 2004-Nov-09

% Documentation:
% http://cp.literature.agilent.com/litweb/pdf/54622-97038.pdf
% OUTPUT 707;":ACQUIRE:TYPE AVERAGE"<terminator>
% OUTPUT 707;":ACQUIRE:COMPLETE 100"<terminator>
% OUTPUT 707;":WAVEFORM:SOURCE CHANNEL1"<terminator>
% OUTPUT 707;":WAVEFORM:FORMAT BYTE"<terminator>
% OUTPUT 707;":ACQUIRE:COUNT 8"<terminator>
% OUTPUT 707;":WAVEFORM:POINTS 500"<terminator>
% OUTPUT 707;":DIGITIZE CHANNEL1"<terminator>
% OUTPUT 707;":WAVEFORM:DATA?"<terminator>

if nargin==0, 
	HP54622Adr=HP54622_DefaultAdr;
end
% Set buffer size
%fclose(HP54622Adr)
%set(HP54622Adr, 'InputBufferSize', 8192)
%fopen(HP54622Adr)

% Make sure the world knows
%GPIB_Write('SYSTEM:DSP "Info: Measuring...!"', HP54622Adr);

% Read data
GPIB_Write('WAVEFORM:FORMAT ASCII', HP54622Adr);
%GPIB_Write('WAVEFORM:POINTS 499', HP54622Adr);
GPIB_Write('WAVEFORM:POINTS 2000', HP54622Adr);
%GPIB_Write('DIGITIZE CHANNEL1, CHANNEL2', HP54622Adr);
GPIB_Write('DIGITIZE CHANNEL1, CHANNEL2, CHANNEL3', HP54622Adr);
data(:,1) = readChannel(HP54622Adr, '1');
data(:,2) = readChannel(HP54622Adr, '2');
data(:,3) = readChannel(HP54622Adr, '3');

% Get x-axis
GPIB_Write('WAVEFORM:XORIGIN?', HP54622Adr);
xo= GPIB_Read(HP54622Adr);
GPIB_Write('WAVEFORM:XINCREMENT?', HP54622Adr);
xi = GPIB_Read(HP54622Adr);
xinc = str2num(xi);
xorig = str2num(xo);
%time = xorig + [0:499]*xinc;   % 500 counts
time = xorig + [0:1999]*xinc;

% Run
GPIB_Write('RUN', HP54622Adr);

% Function to read a channel's data
function data = readChannel(HP54622Adr, chan)
GPIB_Write(['WAVEFORM:SOURCE CHANNEL' chan], HP54622Adr);
GPIB_Write('WAVEFORM:DATA?', HP54622Adr);
s = GPIB_Read(HP54622Adr);
header_length = 2 + sscanf(s(2), '%d');
data = sscanf(s((header_length+1):length(s)), '%f,');

GPIB_Write('SYSTEM:DSP "Info: Measurement done!"', HP54622Adr);
