function Servo_Init(torque)
    load('data/ServoID'); 
    
    %Set joint torque
    simxSetJointForce(clientID,119,torque,simx_opmode_oneshot);
    simxSetJointForce(clientID,107,torque,simx_opmode_oneshot);
    simxSetJointForce(clientID,110,torque,simx_opmode_oneshot);
    simxSetJointForce(clientID,113,torque,simx_opmode_oneshot);
    simxSetJointForce(clientID,116,torque,simx_opmode_oneshot);
    simxSetJointForce(clientID,35,torque,simx_opmode_oneshot);
    simxSetJointForce(clientID,38,torque,simx_opmode_oneshot);
    simxSetJointForce(clientID,41,torque,simx_opmode_oneshot);
    simxSetJointForce(clientID,52,torque,simx_opmode_oneshot);
    simxSetJointForce(clientID,58,torque,simx_opmode_oneshot);
    simxSetJointForce(clientID,61,torque,simx_opmode_oneshot);
    simxSetJointForce(clientID,71,torque,simx_opmode_oneshot);
    simxSetJointForce(clientID,74,torque,simx_opmode_oneshot);
    simxSetJointForce(clientID,77,torque,simx_opmode_oneshot);
    simxSetJointForce(clientID,88,torque,simx_opmode_oneshot);
    simxSetJointForce(clientID,94,torque,simx_opmode_oneshot);
    simxSetJointForce(clientID,97,torque,simx_opmode_oneshot);
    
    %Set Joint Velocity
    simxGetJointPosition(clientID,119,simx_opmode_streaming);
    simxGetJointPosition(clientID,107,simx_opmode_streaming);
    simxGetJointPosition(clientID,110,simx_opmode_streaming);
    simxGetJointPosition(clientID,113,simx_opmode_streaming);
    simxGetJointPosition(clientID,116,simx_opmode_streaming);
    simxGetJointPosition(clientID,35,simx_opmode_streaming);
    simxGetJointPosition(clientID,38,simx_opmode_streaming);
    simxGetJointPosition(clientID,41,simx_opmode_streaming);
    simxGetJointPosition(clientID,52,simx_opmode_streaming);
    simxGetJointPosition(clientID,58,simx_opmode_streaming);
    simxGetJointPosition(clientID,61,simx_opmode_streaming);
    simxGetJointPosition(clientID,71,simx_opmode_streaming);
    simxGetJointPosition(clientID,74,simx_opmode_streaming);
    simxGetJointPosition(clientID,77,simx_opmode_streaming);
    simxGetJointPosition(clientID,88,simx_opmode_streaming);
    simxGetJointPosition(clientID,94,simx_opmode_streaming);
    simxGetJointPosition(clientID,97,simx_opmode_streaming);
    
end
