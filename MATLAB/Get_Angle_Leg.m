function Angle = Get_Angle_Leg()
    load('data/ServoID');
    
    %右足
    d1 = GetServoAngle(KneeR_P);
    d2 = GetServoAngle(AnkleR_P);
    d3 = GetServoAngle(HipR_R);
    d4 = GetServoAngle(AnkleR_R);
    d5 = GetServoAngle(HipR_Y);
    
    %左足
    d6 = GetServoAngle(KneeL_P);
    d7 = GetServoAngle(AnkleL_P);
    d8 = GetServoAngle(HipL_R);
    d9 = GetServoAngle(AnkleL_R);
    d10 = GetServoAngle(HipL_Y);
    
    Angle = [d1 d2 d3 d4 d5 d6 d7 d8 d9 d10];
    
end