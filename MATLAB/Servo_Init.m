%Initialize Servo Motor Function(Set Torque and Get Servo Angle Value)
%引数     torque:サーボの出力トルク　
%戻り値   無し 
function Servo_Init(torque)
%     vrep=remApi('remoteApi');   %DLLファイルの読み込み
    load('data/ServoID');            %ワークスペースの読み込み
    
    %トルクの設定
    vrep.simxSetJointForce(clientID,119,torque,vrep.simx_opmode_oneshot);
    vrep.simxSetJointForce(clientID,107,torque,vrep.simx_opmode_oneshot);
    vrep.simxSetJointForce(clientID,110,torque,vrep.simx_opmode_oneshot);
    vrep.simxSetJointForce(clientID,113,torque,vrep.simx_opmode_oneshot);
    vrep.simxSetJointForce(clientID,116,torque,vrep.simx_opmode_oneshot);
    vrep.simxSetJointForce(clientID,35,torque,vrep.simx_opmode_oneshot);
    vrep.simxSetJointForce(clientID,38,torque,vrep.simx_opmode_oneshot);
    vrep.simxSetJointForce(clientID,41,torque,vrep.simx_opmode_oneshot);
    vrep.simxSetJointForce(clientID,52,torque,vrep.simx_opmode_oneshot);
    vrep.simxSetJointForce(clientID,58,torque,vrep.simx_opmode_oneshot);
    vrep.simxSetJointForce(clientID,61,torque,vrep.simx_opmode_oneshot);
    vrep.simxSetJointForce(clientID,71,torque,vrep.simx_opmode_oneshot);
    vrep.simxSetJointForce(clientID,74,torque,vrep.simx_opmode_oneshot);
    vrep.simxSetJointForce(clientID,77,torque,vrep.simx_opmode_oneshot);
    vrep.simxSetJointForce(clientID,88,torque,vrep.simx_opmode_oneshot);
    vrep.simxSetJointForce(clientID,94,torque,vrep.simx_opmode_oneshot);
    vrep.simxSetJointForce(clientID,97,torque,vrep.simx_opmode_oneshot);
    
    %関節角度の初回取得(これをやらないと正確に角度を取得できない)
    vrep.simxGetJointPosition(clientID,119,vrep.simx_opmode_streaming);
    vrep.simxGetJointPosition(clientID,107,vrep.simx_opmode_streaming);
    vrep.simxGetJointPosition(clientID,110,vrep.simx_opmode_streaming);
    vrep.simxGetJointPosition(clientID,113,vrep.simx_opmode_streaming);
    vrep.simxGetJointPosition(clientID,116,vrep.simx_opmode_streaming);
    vrep.simxGetJointPosition(clientID,35,vrep.simx_opmode_streaming);
    vrep.simxGetJointPosition(clientID,38,vrep.simx_opmode_streaming);
    vrep.simxGetJointPosition(clientID,41,vrep.simx_opmode_streaming);
    vrep.simxGetJointPosition(clientID,52,vrep.simx_opmode_streaming);
    vrep.simxGetJointPosition(clientID,58,vrep.simx_opmode_streaming);
    vrep.simxGetJointPosition(clientID,61,vrep.simx_opmode_streaming);
    vrep.simxGetJointPosition(clientID,71,vrep.simx_opmode_streaming);
    vrep.simxGetJointPosition(clientID,74,vrep.simx_opmode_streaming);
    vrep.simxGetJointPosition(clientID,77,vrep.simx_opmode_streaming);
    vrep.simxGetJointPosition(clientID,88,vrep.simx_opmode_streaming);
    vrep.simxGetJointPosition(clientID,94,vrep.simx_opmode_streaming);
    vrep.simxGetJointPosition(clientID,97,vrep.simx_opmode_streaming);
    
end
