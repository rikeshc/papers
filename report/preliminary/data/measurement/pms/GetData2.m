function [time, data] = HP54622_GetData2 (HP54622Adr)
% function [time, data] = HP54622_GetData2 (HP54622Adr):
% Skrevet av henningg@ifi.uio.no 10/5-2004
% Drastically changed by H�kon A. Hjortland 2004-Nov-09
% futuristically edited by hansbe@ifi.uio.no april2005

if nargin==0, 
	HP54622Adr=HP54622_DefaultAdr; 
end


% <# points> ::= {100 | 250 | 500 | 1000 | 2000 | MAXimum}
points = 'MAX';
GPIB_Write(sprintf(':WAVEFORM:POINTS %s', points), HP54622Adr);

pause(2);
% data(1,:) = readChannel(HP54622Adr, '1');
% data(2,:) = readChannel(HP54622Adr, '2');
% data(3,:) = readChannel(HP54622Adr, '3');
data(:,1) = readChannel(HP54622Adr, '1');
data(:,2) = readChannel(HP54622Adr, '2');
data(:,3) = readChannel(HP54622Adr, '3');

% Get time-axis
GPIB_Write(':WAVEFORM:XORIGIN?', HP54622Adr);
xorig = str2num(GPIB_Read(HP54622Adr));
GPIB_Write(':WAVEFORM:XINCREMENT?', HP54622Adr);
xinc = str2num(GPIB_Read(HP54622Adr));
GPIB_Write(':WAVEFORM:XREFERENCE?', HP54622Adr);
xref = str2num(GPIB_Read(HP54622Adr));
%time = xorig + ([0:length(data(1,:))-1]-xref).*xinc;
time = xorig + ([0:length(data(:,1))-1]-xref)*xinc;
%time = xorig + [0:1999]*xinc;

%GPIB_Write('RUN', HP54622Adr);

% Function to read a channel's data
function [data] = readChannel(HP54622Adr, chan)
GPIB_Write([':WAVEFORM:SOURCE CHANNEL' chan], HP54622Adr);
GPIB_Write(':WAVEFORM:FORMAT BYTE', HP54622Adr); %WORD gives 12 bits, for later... 
GPIB_Write(':WAVEFORM:BYT LSBF', HP54622Adr);
GPIB_Write(':WAVEFORM:UNS 1', HP54622Adr);

% GPIB_Write('WAVEFORM:PRE?', HP54622Adr);
% data=fscanf(HP54622Adr);
% disp(sprintf('%s',data));
% data = 0;

GPIB_Write(':WAVEFORM:YORIGIN?', HP54622Adr);
yorig = str2num(GPIB_Read(HP54622Adr));
GPIB_Write(':WAVEFORM:YINCREMENT?', HP54622Adr);
yinc = str2num(GPIB_Read(HP54622Adr));
GPIB_Write(':WAVEFORM:YREFERENCE?', HP54622Adr);
yref = str2num(GPIB_Read(HP54622Adr));

warning off instrument:fread:unsuccessfulRead

GPIB_Write(':WAVEFORM:DATA?', HP54622Adr);
pause(0.02);
read_bytes = char(ibreaduint8(HP54622Adr, 1)); % Wait for #
while (char(read_bytes)~='#')
read_bytes = ibreaduint8(HP54622Adr, 1);
end
read_bytes = char(ibreaduint8(HP54622Adr, 1)); % Then flush the '8'
read_bytes = ibreaduint8(HP54622Adr, 8);
data_length = str2num(char(read_bytes'));
points = data_length; % divide by 2 if WORD type
data = (yorig+yinc.*(double(ibreaduint8(HP54622Adr, data_length))- yref))';
while (length(data) < points)
     pause(0.02);
     data2 = (yorig+yinc.*(double(ibreaduint8(HP54622Adr, data_length-length(data))) - yref))';
     len2 = length(data2)
     data = [data data2];
 end

terminator = ibreaduint8(HP54622Adr, 1);


warning on instrument:fread:unsuccessfulRead

%[D, num] = fread(HP54622Adr, [] , 'uint16');
%disp(num);disp(D(1:10));
%s = fgets(HP54622Adr);
%header_length = 2 + sscanf(s(2), '%d');
%data = sscanf(s((header_length+1):length(s)), '%f,');
