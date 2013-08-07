%function angle = evaluateShipFuzzy_New(obs_bfr,ship_speed)

obs_avai=[0 0 0 0 0 0 0 0]; % this array stores the presence of the obstacle in seven different zones made by us
fuz_inp=[500 0.5 0 0 0 0 0 0 0 0];% array to be sent to .fis file, first entry is distance, second is speed and rest are input angles for obstacle positions
                                  % all initially set to zero 

obs_bfr=[90 69 10];                                  
n = length(obs_bfr);%calculate the no. of obstacles
j=0;
for i=1:1:n % loop should run as many times as the no. of obstacles in obs_bfr[] array
   
   %the following if else conditions categorizes the various obstacles
   %detected in their respective zones to be evaluated using fuzzy logic
   if (obs_bfr(i)<45 && obs_bfr(i)>0 &&(j==0))
       fuz_inp(3)= obs_bfr(i);
       obs_avai(1)= 1;
       j=1; 
   elseif (obs_bfr(i)<70 && obs_bfr(i)>=45 &&(j==0))
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
   j=0;
end;

%the following if else conditions decides the central obstacle membership
%fuction
m=0;
if (obs_avai(4)~=0 && obs_avai(5)==0 && obs_avai(3)~=0 &&(m==0))
    fuz_inp(10)=fuz_inp(6);
    fuz_inp(6)=0;
    m=1;
elseif (obs_avai(4)~=0 && obs_avai(6)==0 && obs_avai(2)~=0 &&(m==0))
    fuz_inp(10)=fuz_inp(6);
    fuz_inp(6)=0;
    m=1;
elseif (obs_avai(4)~=0 && obs_avai(7)==0 && obs_avai(1)~=0 &&(m==0))
    fuz_inp(10)=fuz_inp(6);
    fuz_inp(6)=0;
    m=1;
end;

                                                                         

a = readfis('steering_control');%read the .fis file
str_angl=evalfis(fuz_inp, a);%evaluate the steering angle
disp(str_angl);%assign the output 