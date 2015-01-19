function Angle_Value = GetServoAngle(ServoID)
    load('data/ServoID');
    
    switch ServoID
        case Neck  
            [~,Angle_Value] = simxGetJointPosition(clientID,119,simx_opmode_buffer);
        case ShoulderL
            [~,Angle_Value] = simxGetJointPosition(clientID,107,simx_opmode_buffer);
        case ElbowL 
            [~,Angle_Value] = simxGetJointPosition(clientID,110,simx_opmode_buffer);
        case ShoulderR
            [~,Angle_Value] = simxGetJointPosition(clientID,113,simx_opmode_buffer);
        case ElbowR
            [~,Angle_Value] = simxGetJointPosition(clientID,116,simx_opmode_buffer);
        case HipL_Y
            [~,Angle_Value] = simxGetJointPosition(clientID,35,simx_opmode_buffer);
        case HipL_R
            [~,Angle_Value] = simxGetJointPosition(clientID,38,simx_opmode_buffer);
        case HipL_P
            [~,Angle_Value] = simxGetJointPosition(clientID,41,simx_opmode_buffer);
        case KneeL_P
            [~,Angle_Value] = simxGetJointPosition(clientID,52,simx_opmode_buffer);
        case AnkleL_P
            [~,Angle_Value] = simxGetJointPosition(clientID,58,simx_opmode_buffer);
        case AnkleL_R 
            [~,Angle_Value] = simxGetJointPosition(clientID,61,simx_opmode_buffer);
        case HipR_Y
            [~,Angle_Value] = simxGetJointPosition(clientID,71,simx_opmode_buffer);
        case HipR_R
            [~,Angle_Value] = simxGetJointPosition(clientID,74,simx_opmode_buffer);
        case HipR_P
            [~,Angle_Value] = simxGetJointPosition(clientID,77,simx_opmode_buffer);
        case KneeR_P
            [~,Angle_Value] = simxGetJointPosition(clientID,88,simx_opmode_buffer);
        case AnkleR_P
            [~,Angle_Value] = simxGetJointPosition(clientID,94,simx_opmode_buffer);
        case AnkleR_R
            [~,Angle_Value] = simxGetJointPosition(clientID,97,simx_opmode_buffer);
    end
    Angle_Value = Angle_Value * 180 / 3.14;
end