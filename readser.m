function readser(obj,event)
% Read data
baa = obj.BytesAvailable;
d = fread(obj,baa,'uint8'); 
disp(d);