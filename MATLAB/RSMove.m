%Move Servo Motor Function
%����     ServoID:�T�[�{��ID(���܂�֌W�Ȃ��H) Angle:�p�x(Degree) Vel:�p���x(�i�K�ŕ�����)
%�߂�l   ���� 
function RSMove(ServoID,Angle)

    Angle_Value = Angle * 3.14 / 180;
    
    load('ServoID');
    
    switch ServoID
        case Neck       %�񃈁[
            vrep.simxSetJointTargetPosition(clientID,104,Angle_Value,vrep.simx_opmode_oneshot);
        case ShoulderL  %�����s�b�`
            vrep.simxSetJointTargetPosition(clientID,92,Angle_Value,vrep.simx_opmode_oneshot);
        case ElbowL     %�������[��
            vrep.simxSetJointTargetPosition(clientID,95,Angle_Value,vrep.simx_opmode_oneshot);
        case ShoulderR  %�E���s�b�`
            vrep.simxSetJointTargetPosition(clientID,98,Angle_Value,vrep.simx_opmode_oneshot);
        case ElbowR     %�E�����[��
            vrep.simxSetJointTargetPosition(clientID,101,Angle_Value,vrep.simx_opmode_oneshot);
        case HipL_Y     %���҃��[
            vrep.simxSetJointTargetPosition(clientID,20,Angle_Value,vrep.simx_opmode_oneshot);
        case HipL_R     %���҃��[��
            vrep.simxSetJointTargetPosition(clientID,23,Angle_Value,vrep.simx_opmode_oneshot);
        case HipL_P     %���҃s�b�`
            vrep.simxSetJointTargetPosition(clientID,26,Angle_Value,vrep.simx_opmode_oneshot);
        case KneeL_P    %���G�s�b�`
            vrep.simxSetJointTargetPosition(clientID,37,Angle_Value,vrep.simx_opmode_oneshot);
        case AnkleL_P   %������s�b�`
            vrep.simxSetJointTargetPosition(clientID,43,Angle_Value,vrep.simx_opmode_oneshot);
        case AnkleL_R   %�����񃍁[��
            vrep.simxSetJointTargetPosition(clientID,46,Angle_Value,vrep.simx_opmode_oneshot);
        case HipR_Y     %�E�҃��[
            vrep.simxSetJointTargetPosition(clientID,56,Angle_Value,vrep.simx_opmode_oneshot);
        case HipR_R     %�E�҃��[��
            vrep.simxSetJointTargetPosition(clientID,59,Angle_Value,vrep.simx_opmode_oneshot);
        case HipR_P     %�E�҃s�b�`
            vrep.simxSetJointTargetPosition(clientID,62,Angle_Value,vrep.simx_opmode_oneshot);
        case KneeR_P    %�E�G�s�b�`
            vrep.simxSetJointTargetPosition(clientID,73,Angle_Value,vrep.simx_opmode_oneshot);
        case AnkleR_P   %�E����s�b�`
            vrep.simxSetJointTargetPosition(clientID,79,Angle_Value,vrep.simx_opmode_oneshot);
        case AnkleR_R   %�E���񃍁[��
            vrep.simxSetJointTargetPosition(clientID,82,Angle_Value,vrep.simx_opmode_oneshot);
    end
    
end