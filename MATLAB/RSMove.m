%Move Servo Motor Function
%����     ServoID:�T�[�{��ID(���܂�֌W�Ȃ��H) Angle:�p�x(Degree) Vel:�p���x(�i�K�ŕ�����)
%�߂�l   ���� 
function RSMove(ServoID,Angle)

    Angle_Value = Angle * 3.14 / 180;
    
    load('ServoID');
    
    switch ServoID
        case Neck       %�񃈁[
            vrep.simxSetJointTargetPosition(clientID,119,Angle_Value,vrep.simx_opmode_oneshot);
        case ShoulderL  %�����s�b�`
            vrep.simxSetJointTargetPosition(clientID,107,Angle_Value,vrep.simx_opmode_oneshot);
        case ElbowL     %�������[��
            vrep.simxSetJointTargetPosition(clientID,110,Angle_Value,vrep.simx_opmode_oneshot);
        case ShoulderR  %�E���s�b�`
            vrep.simxSetJointTargetPosition(clientID,113,Angle_Value,vrep.simx_opmode_oneshot);
        case ElbowR     %�E�����[��
            vrep.simxSetJointTargetPosition(clientID,116,Angle_Value,vrep.simx_opmode_oneshot);
        case HipL_Y     %���҃��[
            vrep.simxSetJointTargetPosition(clientID,35,Angle_Value,vrep.simx_opmode_oneshot);
        case HipL_R     %���҃��[��
            vrep.simxSetJointTargetPosition(clientID,38,Angle_Value,vrep.simx_opmode_oneshot);
        case HipL_P     %���҃s�b�`
            vrep.simxSetJointTargetPosition(clientID,41,Angle_Value,vrep.simx_opmode_oneshot);
        case KneeL_P    %���G�s�b�`
            vrep.simxSetJointTargetPosition(clientID,52,Angle_Value,vrep.simx_opmode_oneshot);
        case AnkleL_P   %������s�b�`
            vrep.simxSetJointTargetPosition(clientID,58,Angle_Value,vrep.simx_opmode_oneshot);
        case AnkleL_R   %�����񃍁[��
            vrep.simxSetJointTargetPosition(clientID,61,Angle_Value,vrep.simx_opmode_oneshot);
        case HipR_Y     %�E�҃��[
            vrep.simxSetJointTargetPosition(clientID,71,Angle_Value,vrep.simx_opmode_oneshot);
        case HipR_R     %�E�҃��[��
            vrep.simxSetJointTargetPosition(clientID,74,Angle_Value,vrep.simx_opmode_oneshot);
        case HipR_P     %�E�҃s�b�`
            vrep.simxSetJointTargetPosition(clientID,77,Angle_Value,vrep.simx_opmode_oneshot);
        case KneeR_P    %�E�G�s�b�`
            vrep.simxSetJointTargetPosition(clientID,88,Angle_Value,vrep.simx_opmode_oneshot);
        case AnkleR_P   %�E����s�b�`
            vrep.simxSetJointTargetPosition(clientID,94,Angle_Value,vrep.simx_opmode_oneshot);
        case AnkleR_R   %�E���񃍁[��
            vrep.simxSetJointTargetPosition(clientID,97,Angle_Value,vrep.simx_opmode_oneshot);
    end
    
end