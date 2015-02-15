function RSMove(ServoID,Angle)

    Angle_Value = Angle * 3.14 / 180;
    
    load('data/ServoID');
    
    switch ServoID
        case Neck 
            simxSetJointTargetPosition(clientID,119,Angle_Value,simx_opmode_oneshot);
        case ShoulderL
            simxSetJointTargetPosition(clientID,107,Angle_Value,simx_opmode_oneshot);
        case ElbowL
            simxSetJointTargetPosition(clientID,110,Angle_Value,simx_opmode_oneshot);
        case ShoulderR
            simxSetJointTargetPosition(clientID,113,Angle_Value,simx_opmode_oneshot);
        case ElbowR
            simxSetJointTargetPosition(clientID,116,Angle_Value,simx_opmode_oneshot);
        case HipL_Y
            simxSetJointTargetPosition(clientID,35,Angle_Value,simx_opmode_oneshot);
        case HipL_R
            simxSetJointTargetPosition(clientID,38,Angle_Value,simx_opmode_oneshot);
        case HipL_P
            simxSetJointTargetPosition(clientID,41,Angle_Value,simx_opmode_oneshot);
        case KneeL_P 
            simxSetJointTargetPosition(clientID,52,Angle_Value,simx_opmode_oneshot);
        case AnkleL_P
            simxSetJointTargetPosition(clientID,58,Angle_Value,simx_opmode_oneshot);
        case AnkleL_R
            simxSetJointTargetPosition(clientID,61,Angle_Value,simx_opmode_oneshot);
        case HipR_Y
            simxSetJointTargetPosition(clientID,71,Angle_Value,simx_opmode_oneshot);
        case HipR_R
            simxSetJointTargetPosition(clientID,74,Angle_Value,simx_opmode_oneshot);
        case HipR_P
            simxSetJointTargetPosition(clientID,77,Angle_Value,simx_opmode_oneshot);
        case KneeR_P
            simxSetJointTargetPosition(clientID,88,Angle_Value,simx_opmode_oneshot);
        case AnkleR_P   
            simxSetJointTargetPosition(clientID,94,Angle_Value,simx_opmode_oneshot);
        case AnkleR_R   
            simxSetJointTargetPosition(clientID,97,Angle_Value,simx_opmode_oneshot);
    end
    
end