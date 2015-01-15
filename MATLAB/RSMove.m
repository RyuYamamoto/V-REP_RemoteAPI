%Move Servo Motor Function
%引数     ServoID:サーボのID(あまり関係ない？) Angle:角度(Degree) Vel:角速度(段階で分ける)
%戻り値   無し 
function RSMove(ServoID,Angle)

    Angle_Value = Angle * 3.14 / 180;
    
    load('ServoID');
    
    switch ServoID
        case Neck       %首ヨー
            vrep.simxSetJointTargetPosition(clientID,104,Angle_Value,vrep.simx_opmode_oneshot);
        case ShoulderL  %左肩ピッチ
            vrep.simxSetJointTargetPosition(clientID,92,Angle_Value,vrep.simx_opmode_oneshot);
        case ElbowL     %左肩ロール
            vrep.simxSetJointTargetPosition(clientID,95,Angle_Value,vrep.simx_opmode_oneshot);
        case ShoulderR  %右肩ピッチ
            vrep.simxSetJointTargetPosition(clientID,98,Angle_Value,vrep.simx_opmode_oneshot);
        case ElbowR     %右肩ロール
            vrep.simxSetJointTargetPosition(clientID,101,Angle_Value,vrep.simx_opmode_oneshot);
        case HipL_Y     %左股ヨー
            vrep.simxSetJointTargetPosition(clientID,20,Angle_Value,vrep.simx_opmode_oneshot);
        case HipL_R     %左股ロール
            vrep.simxSetJointTargetPosition(clientID,23,Angle_Value,vrep.simx_opmode_oneshot);
        case HipL_P     %左股ピッチ
            vrep.simxSetJointTargetPosition(clientID,26,Angle_Value,vrep.simx_opmode_oneshot);
        case KneeL_P    %左膝ピッチ
            vrep.simxSetJointTargetPosition(clientID,37,Angle_Value,vrep.simx_opmode_oneshot);
        case AnkleL_P   %左足首ピッチ
            vrep.simxSetJointTargetPosition(clientID,43,Angle_Value,vrep.simx_opmode_oneshot);
        case AnkleL_R   %左足首ロール
            vrep.simxSetJointTargetPosition(clientID,46,Angle_Value,vrep.simx_opmode_oneshot);
        case HipR_Y     %右股ヨー
            vrep.simxSetJointTargetPosition(clientID,56,Angle_Value,vrep.simx_opmode_oneshot);
        case HipR_R     %右股ロール
            vrep.simxSetJointTargetPosition(clientID,59,Angle_Value,vrep.simx_opmode_oneshot);
        case HipR_P     %右股ピッチ
            vrep.simxSetJointTargetPosition(clientID,62,Angle_Value,vrep.simx_opmode_oneshot);
        case KneeR_P    %右膝ピッチ
            vrep.simxSetJointTargetPosition(clientID,73,Angle_Value,vrep.simx_opmode_oneshot);
        case AnkleR_P   %右足首ピッチ
            vrep.simxSetJointTargetPosition(clientID,79,Angle_Value,vrep.simx_opmode_oneshot);
        case AnkleR_R   %右足首ロール
            vrep.simxSetJointTargetPosition(clientID,82,Angle_Value,vrep.simx_opmode_oneshot);
    end
    
end