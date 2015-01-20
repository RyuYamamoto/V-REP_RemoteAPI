function Angle = Get_Angle_Arm()
    load('data/ServoID.mat');
    
    d1 = GetServoAngle(ElbowR);
    d2 = GetServoAngle(ElbowL);
    
    Angle = [d1 d2];
end
