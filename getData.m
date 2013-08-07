function getData(s)

serialData = [0 0];
if s.BytesAvailable>0
    
    serialData=fread(s,s.BytesAvailable, 'uint8');
    obs_bfr = [0 0 0];
    if(length(serialData)>3)
        disp('Printing new Values');
        ship_speed=serialData(2)/255.0;
        for i=3:1:(length(serialData)-1)
            
            %disp(serialData(i));
            obs_bfr(i-2)= serialData(i);
            %disp(evaluateShipFuzzy(serial
        
        end
    end
    disp(obs_bfr);
    steerAngle = 180-evaluateShipFuzzy_New(obs_bfr,0.5);%ship_speed);
    disp(steerAngle);
    %if (steerAngle>45 || steerAngle<135)
    %    ship_speed_N=0.2;
    %end;
    serialTxData = [ 91 steerAngle 80 90 93];
    fwrite(s,serialTxData,'uint8');
end

