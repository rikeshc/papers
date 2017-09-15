function HPE3631Init(HP3631Adr)
% function HPE3631_init(HP3631Adr)
% Initialize the HPE3631A to initial state

% Written by henningg@ifi.uio.no 10/06-2004

if nargin==0, HP3631Adr=HPE3631_DefaultAdr; end

fprintf('Initializing HP3631 with GPIB addr : %g \n', HP3631Adr); 
GPIB_Write('*RST;*CLS;*ESE 60;  INST OUT1; VOLT 0; CURR 0.1; INST OUT2; VOLT 0; CURR 0.1;', HP3631Adr);


%GPIB_Write('*RST;*CLS;*ESE 60; INST P6V; VOLT 0; CURR 0.1; INST P25V;VOLT 0;CURR 0.1; INST N25V;VOLT 0; CURR 0.1;', HP3631Adr);


