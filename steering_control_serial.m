x1=[30 0.5 0.5 0 0 0 0 0 0 0];
a = readfis('steering_control');
y1=evalfis(x1, a);
disp(y1);
disp(y1);

y1;
INPUTBUFFER = 10240;
TMR_PERIOD = 0.5;
hi = [ 91 90 105 33 93 ]; % [Hi!]

s = serial('COM33', 'BaudRate',9600);
set(s,'InputBufferSize', INPUTBUFFER);
fopen(s);
%fwrite(s,hi,'uint8');

%text = fgetl(s);
%disp (text);
%fclose(s);

%% Setup a timer
% The timer has a callback that reads the serial port and updates the
% stripchart
% Construct a timer object with a timer callback funciton handle,
% getData

t = timer('TimerFcn', @(x,y)getData(s), 'Period', TMR_PERIOD, 'StartDelay', 3, 'TasksToExecute', 3000);
set(t,'ExecutionMode','fixedRate');
start(t);

