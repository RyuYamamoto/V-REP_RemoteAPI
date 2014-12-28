%Get Servo Angle funtion
%引数      ServoID:取得したいサーボのID
%戻り値    Angle_Value:取得した角度(RemoteAPI上ではラジアンで戻るが角度に直して戻す)
function Angle_Value = GetServoAngle(ServoID)
    load('data/ServoID');
    
    switch ServoID
        case Neck       %首ヨー
            [~,Angle_Value] = vrep.simxGetJointPosition(clientID,119,vrep.simx_opmode_buffer);
        case ShoulderL  %左肩ピッチ
            [~,Angle_Value] = vrep.simxGetJointPosition(clientID,107,vrep.simx_opmode_buffer);
        case ElbowL     %左肩ロール
            [~,Angle_Value] = vrep.simxGetJointPosition(clientID,110,vrep.simx_opmode_buffer);
        case ShoulderR  %右肩ピッチ
            [~,Angle_Value] = vrep.simxGetJointPosition(clientID,113,vrep.simx_opmode_buffer);
        case ElbowR     %右肩ロール
            [~,Angle_Value] = vrep.simxGetJointPosition(clientID,116,vrep.simx_opmode_buffer);
        case HipL_Y     %左股ヨー
            [~,Angle_Value] = vrep.simxGetJointPosition(clientID,35,vrep.simx_opmode_buffer);
        case HipL_R     %左股ロール
            [~,Angle_Value] = vrep.simxGetJointPosition(clientID,38,vrep.simx_opmode_buffer);
        case HipL_P     %左股ピッチ
            [~,Angle_Value] = vrep.simxGetJointPosition(clientID,41,vrep.simx_opmode_buffer);
        case KneeL_P    %左膝ピッチ
            [~,Angle_Value] = vrep.simxGetJointPosition(clientID,52,vrep.simx_opmode_buffer);
        case AnkleL_P   %左足首ピッチ
            [~,Angle_Value] = vrep.simxGetJointPosition(clientID,58,vrep.simx_opmode_buffer);
        case AnkleL_R   %左足首ロール
            [~,Angle_Value] = vrep.simxGetJointPosition(clientID,61,vrep.simx_opmode_buffer);
        case HipR_Y     %右股ヨー
            [~,Angle_Value] = vrep.simxGetJointPosition(clientID,71,vrep.simx_opmode_buffer);
        case HipR_R     %右股ロール
            [~,Angle_Value] = vrep.simxGetJointPosition(clientID,74,vrep.simx_opmode_buffer);
        case HipR_P     %右股ピッチ
            [~,Angle_Value] = vrep.simxGetJointPosition(clientID,77,vrep.simx_opmode_buffer);
        case KneeR_P    %右膝ピッチ
            [~,Angle_Value] = vrep.simxGetJointPosition(clientID,88,vrep.simx_opmode_buffer);
        case AnkleR_P   %右足首ピッチ
            [~,Angle_Value] = vrep.simxGetJointPosition(clientID,94,vrep.simx_opmode_buffer);
        case AnkleR_R   %右足首ロール
            [~,Angle_Value] = vrep.simxGetJointPosition(clientID,97,vrep.simx_opmode_buffer);
    end
    Angle_Value = Angle_Value * 180 / 3.14;
end