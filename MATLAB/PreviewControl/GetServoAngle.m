%Get Servo Angle funtion
%����      ServoID:�擾�������T�[�{��ID
%�߂�l    Angle_Value:�擾�����p�x(RemoteAPI��ł̓��W�A���Ŗ߂邪�p�x�ɒ����Ė߂�)
function Angle_Value = GetServoAngle(ServoID)
    load('data/ServoID');
    
    switch ServoID
        case Neck       %�񃈁[
            [~,Angle_Value] = vrep.simxGetJointPosition(clientID,119,vrep.simx_opmode_buffer);
        case ShoulderL  %�����s�b�`
            [~,Angle_Value] = vrep.simxGetJointPosition(clientID,107,vrep.simx_opmode_buffer);
        case ElbowL     %�������[��
            [~,Angle_Value] = vrep.simxGetJointPosition(clientID,110,vrep.simx_opmode_buffer);
        case ShoulderR  %�E���s�b�`
            [~,Angle_Value] = vrep.simxGetJointPosition(clientID,113,vrep.simx_opmode_buffer);
        case ElbowR     %�E�����[��
            [~,Angle_Value] = vrep.simxGetJointPosition(clientID,116,vrep.simx_opmode_buffer);
        case HipL_Y     %���҃��[
            [~,Angle_Value] = vrep.simxGetJointPosition(clientID,35,vrep.simx_opmode_buffer);
        case HipL_R     %���҃��[��
            [~,Angle_Value] = vrep.simxGetJointPosition(clientID,38,vrep.simx_opmode_buffer);
        case HipL_P     %���҃s�b�`
            [~,Angle_Value] = vrep.simxGetJointPosition(clientID,41,vrep.simx_opmode_buffer);
        case KneeL_P    %���G�s�b�`
            [~,Angle_Value] = vrep.simxGetJointPosition(clientID,52,vrep.simx_opmode_buffer);
        case AnkleL_P   %������s�b�`
            [~,Angle_Value] = vrep.simxGetJointPosition(clientID,58,vrep.simx_opmode_buffer);
        case AnkleL_R   %�����񃍁[��
            [~,Angle_Value] = vrep.simxGetJointPosition(clientID,61,vrep.simx_opmode_buffer);
        case HipR_Y     %�E�҃��[
            [~,Angle_Value] = vrep.simxGetJointPosition(clientID,71,vrep.simx_opmode_buffer);
        case HipR_R     %�E�҃��[��
            [~,Angle_Value] = vrep.simxGetJointPosition(clientID,74,vrep.simx_opmode_buffer);
        case HipR_P     %�E�҃s�b�`
            [~,Angle_Value] = vrep.simxGetJointPosition(clientID,77,vrep.simx_opmode_buffer);
        case KneeR_P    %�E�G�s�b�`
            [~,Angle_Value] = vrep.simxGetJointPosition(clientID,88,vrep.simx_opmode_buffer);
        case AnkleR_P   %�E����s�b�`
            [~,Angle_Value] = vrep.simxGetJointPosition(clientID,94,vrep.simx_opmode_buffer);
        case AnkleR_R   %�E���񃍁[��
            [~,Angle_Value] = vrep.simxGetJointPosition(clientID,97,vrep.simx_opmode_buffer);
    end
    Angle_Value = Angle_Value * 180 / 3.14;
end