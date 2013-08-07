obs_avai=[0 0 0 0 0 0 0];%%this array stores the presense(not location only tells if present or not) of the obstacle in seven different zones made by us
fuz_inp=[500 speed_input 0 0 0 0 0 0 0 0];%%array to be sent to .fis file, first entry is distance, second is speed and rest are input angles for obstacle positions
j=0;
for i=1:1:n%%n is no. of obstacles detected by ultrasonic sensor in one sweep. Runs as many times as the no. of obstacles
   if (obs_bfr(i)<45 && obs_bfr(i) >0&& (j==0))%%checks if obstacle(position of first obstacle sent by ultrasonic sensor) lies in (0 45) angle zone
       fuz_inp(3)= obs_bfr(i);%% assigns the position to the respective input in the array to be sent to .fis file
       obs_avai(1)= 1;%% updates the presence of the obstacle in that zone 
       j=1;
   elseif (obs_bfr(i)<70 && obs_bfr(i)>=45 &&(j==0))%% similarly the following assignments are done
       fuz_inp(4)= obs_bfr(i);
       obs_avai(2)= 1;
       j=1;
   elseif (obs_bfr(i)<85 && obs_bfr(i)>=70 &&(j==0))
       
       fuz_inp(5)= obs_bfr(i);
       obs_avai(3)= 1;
       j=1;
    elseif (obs_bfr(i)<95 && obs_bfr(i)>=85 &&(j==0))
       
       fuz_inp(6)= obs_bfr(i);
       obs_avai(4)= 1;
       j=1;
    elseif (obs_bfr(i)<110 && obs_bfr(i)>=95 &&(j==0))
       
       fuz_inp(7)= obs_bfr(i);
       obs_avai(5)= 1;
       j=1;
       
    elseif (obs_bfr(i)<135 && obs_bfr(i)>=110 &&(j==0))
       
       fuz_inp(8)= obs_bfr(i);
       obs_avai(6)= 1;
       j=1;
    elseif (obs_bfr(i)<180 && obs_bfr(i)>=135 &&(j==0))
       
       fuz_inp(9)= obs_bfr(i);
       obs_avai(7)= 1;
       j=1;
   end;  
end;
%%all the values assigned to their respective zones initially


% deciding whether to move to right or left if obstacle is present in centre

if (obs_avai(4)~=0 && obs_avai(5)~=0 && obs_avai(3)==0)
    fuz_inp(10)=fuz_inp(3);
    fuz_inp(3)=0;
elseif (obs_avai(4)~=0 && obs_avai(6)==0 && obs_avai(2)~=0)
    fuz_inp(3)=fuz_inp(10);
    fuz_inp(10)=0;
elseif (obs_avai(4)~=0 && obs_avai(7)~=0 && obs_avai(1)==0)
    fuz_inp(10)=fuz_inp(3);
    fuz_inp(3)=0;
end;
% final input array to be sent to .fis file decided

% evaluating
a = readfis('steering_control');%%reading the .fis file
str_angl=evalfis(fuz_inp, a);%% providing the input array and evaluating the steering angle
disp(str_angl);%% printing the steering angle

   