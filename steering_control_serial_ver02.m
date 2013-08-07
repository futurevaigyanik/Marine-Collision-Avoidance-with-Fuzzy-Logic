x1=[30 0.5 0.5 0 0 0 0 0 0 0];
a = readfis('steering_control');
y1=evalfis(x1, a);
disp(y1);
disp(y1);
INPUTBUFFER = 1024;
TMR_PERIOD = 0.9;
hi = [ 91 72 105 33 93 ]; % [Hi!]

%s = serial('COM31', 'BaudRate',9600);
%set(s,'InputBufferSize', INPUTBUFFER);
%fopen(s);
%fwrite(s,hi,'uint8');

s = serial('COM31',...
    'BaudRate',9600,... 
    'InputBufferSize',1024,... % 10 times ba for monitoring
    'BytesAvailableFcn',{@readser},... 
    'BytesAvailableFcnMode','byte',... 
    'BytesAvailableFcnCount',6 ...
    );
fopen(s);


