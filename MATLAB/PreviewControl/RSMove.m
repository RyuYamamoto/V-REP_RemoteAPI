%Move Servo Motor Function
%引数     ServoID:サーボのID(あまり関係ない？) Angle:角度(Degree) Vel:角速度(段階で分ける)
%引数     ServoID:サーボのID(あまり関係ない？) Angle:角度(Degree)
%戻り値   無し 
function RSMove(ServoID,Angle)

    Angle_Value = Angle * 3.14 / 180;
    
    load('data/ServoID');
    
    switch ServoID
        case Neck       %首ヨー
            vrep.simxSetJointTargetPosition(clientID,119,Angle_Value,vrep.simx_opmode_oneshot);
        case ShoulderL  %左肩ピッチ
            vrep.simxSetJointTargetPosition(clientID,107,Angle_Value,vrep.simx_opmode_oneshot);
        case ElbowL     %左肩ロール
            vrep.simxSetJointTargetPosition(clientID,110,Angle_Value,vrep.simx_opmode_oneshot);
        case ShoulderR  %右肩ピッチ
            vrep.simxSetJointTargetPosition(clientID,113,Angle_Value,vrep.simx_opmode_oneshot);
        case ElbowR     %右肩ロール
            vrep.simxSetJointTargetPosition(clientID,116,Angle_Value,vrep.simx_opmode_oneshot);
        case HipL_Y     %左股ヨー
            vrep.simxSetJointTargetPosition(clientID,35,Angle_Value,vrep.simx_opmode_oneshot);
        case HipL_R     %左股ロール
            vrep.simxSetJointTargetPosition(clientID,38,Angle_Value,vrep.simx_opmode_oneshot);
        case HipL_P     %左股ピッチ
            vrep.simxSetJointTargetPosition(clientID,41,Angle_Value,vrep.simx_opmode_oneshot);
        case KneeL_P    %左膝ピッチ
            vrep.simxSetJointTargetPosition(clientID,52,Angle_Value,vrep.simx_opmode_oneshot);
        case AnkleL_P   %左足首ピッチ
            vrep.simxSetJointTargetPosition(clientID,58,Angle_Value,vrep.simx_opmode_oneshot);
        case AnkleL_R   %左足首ロール
            vrep.simxSetJointTargetPosition(clientID,61,Angle_Value,vrep.simx_opmode_oneshot);
        case HipR_Y     %右股ヨー
            vrep.simxSetJointTargetPosition(clientID,71,Angle_Value,vrep.simx_opmode_oneshot);
        case HipR_R     %右股ロール
            vrep.simxSetJointTargetPosition(clientID,74,Angle_Value,vrep.simx_opmode_oneshot);
        case HipR_P     %右股ピッチ
            vrep.simxSetJointTargetPosition(clientID,77,Angle_Value,vrep.simx_opmode_oneshot);
        case KneeR_P    %右膝ピッチ
            vrep.simxSetJointTargetPosition(clientID,88,Angle_Value,vrep.simx_opmode_oneshot);
        case AnkleR_P   %右足首ピッチ
            vrep.simxSetJointTargetPosition(clientID,94,Angle_Value,vrep.simx_opmode_oneshot);
        case AnkleR_R   %右足首ロール
            vrep.simxSetJointTargetPosition(clientID,97,Angle_Value,vrep.simx_opmode_oneshot);
    end
    
end
