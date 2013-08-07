%%xpos=[0 100 200 300];%path given tothe ship
%%ypos=[0 200 600 500];%in waypoints
obst_buffer= 0;
fuzzzy_input[]x1;
%%plot(xpos,ypos);%graph of the path
%%waypntpvs=[xpos(1,1) ypos(1,1)];%waypoints in action
%%waypntnxt=[xpos(1,2) ypos(1,2)];
%%direction=(waypntnxt(1,2)-waypntpvs(1,2))/(waypntnxt(1,1)-waypntpvs(1,1));%slope of the line
%%speed=1;%user set
%now check for the interrupt if obstacle is present
if (obst_buffer~=0)
    obst_pos= input;%receive position array
    obst_dis= iput1;
end;
if (obs_pos(1,1)&&(obs_pos(1,2)||obs_pos(1,3)||obs_pos(1,4||obs_pos(1,5)||obs_pos(1,6)))==1)
x1=[obs_distance speed obst_pos 90];
else    
x1=[obs_dis speed 90 obst_pos obst_pos];%needs to be corrected%    
end;
%fuzzy computation%
a = readfis('steering_control');%reading the fis file%
y1=evalfis(x1, a);%evaluating fis file%
disp(y1);%printing the output%